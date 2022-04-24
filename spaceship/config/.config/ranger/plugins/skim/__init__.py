# This is a sample commands.py.  You can add your own commands here.
#
# Please refer to commands_full.py for all the default commands and a complete
# documentation.  Do NOT add them all here, or you may end up with defunct
# commands when upgrading ranger.

# A simple command for demonstration purposes follows.
# -----------------------------------------------------------------------------

from __future__ import (absolute_import, division, print_function)

# You can import any python module as needed.
import os
import os.path
import ranger.api
import ranger.core.fm
import ranger.ext.signals
from subprocess import Popen, PIPE, run

# You always need to import ranger.api.commands here to get the Command class:
from ranger.api.commands import Command
from subprocess import PIPE

class sk_cd(Command):
    def execute(self):
        # command="fd -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune -o -type d -print 2> /dev/null | cut -b3- | sk"
        command="fd -L . --type d | cut -b3- | sk"

        sk = self.fm.execute_command(command, stdout=PIPE)
        stdout, stderr = sk.communicate()
        directory = stdout.decode('utf-8').rstrip('\n')
        self.fm.cd(directory)

# https://github.com/ranger/ranger/wiki/Integrating-File-Search-with-sk
# Now, simply bind this function to a key, by adding this to your ~/.config/ranger/rc.conf: map <C-f> sk_select
class sk_select(Command):
    """
    :sk_select

    Find a file using sk.

    With a prefix argument select only directories.
    """
    def execute(self):
        import subprocess
        if self.quantifier:
            # match only directories
            command="fd -L --type d | sed 1d | cut -b3- | sk"
        else:
            # match files and directories
            command="fd -L | sed 1d | cut -b3- | sk"
        sk = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = sk.communicate()
        if sk.returncode == 0:
            sk_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(sk_file):
                self.fm.cd(sk_file)
            else:
                self.fm.select_file(sk_file)
