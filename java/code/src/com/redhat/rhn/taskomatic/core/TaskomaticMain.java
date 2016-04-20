/**
 * Copyright (c) 2015 SUSE LLC
 *
 * This software is licensed to you under the GNU General Public License,
 * version 2 (GPLv2). There is NO WARRANTY for this software, express or
 * implied, including the implied warranties of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. You should have received a copy of GPLv2
 * along with this software; if not, see
 * http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
 *
 * Red Hat trademarks are not licensed under GPLv2. No permission is
 * granted to use or replicate Red Hat trademarks that are incorporated
 * in this software or its documentation.
 */
package com.redhat.rhn.taskomatic.core;

import org.apache.log4j.Logger;
import java.net.UnknownHostException;

/**
 * Main process for taskomatic to be run on the console or with systemd.
 * Replaces {@link TaskomaticDaemon}
 */
public class TaskomaticMain {

    private SchedulerKernel kernel;
    protected final Logger log = Logger.getLogger(this.getClass());

    public void run(String []argv) {
        try {
            SchedulerKernel kernel = new SchedulerKernel();
            try {
                kernel.startup();
            }
            catch (TaskomaticException e) {
                log.fatal(e.getMessage(), e);
                System.exit(-1);

            }
        } catch (InstantiationException|UnknownHostException e) {
            log.fatal(e.getMessage(), e);
            System.exit(-1);
        }
    }

    public static void main(String []argv) {
        TaskomaticMain taskomatic = new TaskomaticMain();
        taskomatic.run(argv);
    }
}


