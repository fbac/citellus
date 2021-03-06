#!/bin/bash
# Copyright (C) 2018 Robin Černín <cerninr@gmail.com>
# Copyright (C) 2018 Pablo Iranzo Gómez <Pablo.Iranzo@gmail.com>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# we can run this against fs snapshot or live system

# long_name: Director saves all rules into iptables file
# description: Checks for iptables rules were not overwritten on Director run
# bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1541528
# priority: 800

# Load common functions
[[ -f "${CITELLUS_BASE}/common-functions.sh" ]] && . "${CITELLUS_BASE}/common-functions.sh"

is_required_file "${CITELLUS_ROOT}/etc/sysconfig/iptables"

if is_lineinfile "NIPv4" "${CITELLUS_ROOT}/etc/sysconfig/iptables" ; then
    echo $"NIPv4 statement found in /etc/sysconfig/iptables" >&2
    echo $"https://bugzilla.redhat.com/show_bug.cgi?id=1541528" >&2
    exit ${RC_FAILED}
else
    exit ${RC_OKAY}
fi

