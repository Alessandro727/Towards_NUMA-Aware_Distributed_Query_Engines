subdir=src/backend/utils/mmgr
top_builddir=../../../../..
include $(top_builddir)/src/Makefile.global

TARGETS=vmem_tracker redzone_handler runaway_cleaner idle_tracker event_version memprot mcxt

include $(top_srcdir)/src/backend/mock.mk

vmem_tracker.t: \
	$(MOCK_DIR)/backend/access/hash/hashpage_mock.o \
	$(MOCK_DIR)/backend/storage/ipc/shmem_mock.o \
	$(MOCK_DIR)/backend/utils/error/assert_mock.o \
	$(MOCK_DIR)/backend/utils/error/elog_mock.o \
	$(MOCK_DIR)/backend/utils/fmgr/fmgr_mock.o \
	$(MOCK_DIR)/backend/utils/mmgr/event_version_mock.o \
	$(MOCK_DIR)/backend/utils/mmgr/idle_tracker_mock.o \
	$(MOCK_DIR)/backend/utils/mmgr/mcxt_mock.o \
	$(MOCK_DIR)/backend/utils/mmgr/memprot_mock.o \
	$(MOCK_DIR)/backend/utils/mmgr/redzone_handler_mock.o \
	$(MOCK_DIR)/backend/utils/mmgr/runaway_cleaner_mock.o\
	$(MOCK_DIR)/backend/access/hash/hash_mock.o\
	$(MOCK_DIR)/backend/utils/fmgr/fmgr_mock.o

memprot.t: \
	$(MOCK_DIR)/backend/utils/mmgr/vmem_tracker_mock.o \
	$(MOCK_DIR)/backend/utils/error/assert_mock.o \
	$(MOCK_DIR)/backend/utils/error/elog_mock.o \
	$(MOCK_DIR)/backend/utils/mmgr/event_version_mock.o\
	$(MOCK_DIR)/backend/access/hash/hash_mock.o\
	$(MOCK_DIR)/backend/utils/fmgr/fmgr_mock.o

redzone_handler.t: \
	$(MOCK_DIR)/backend/storage/ipc/shmem_mock.o \
	$(MOCK_DIR)/backend/storage/lmgr/lwlock_mock.o \
	$(MOCK_DIR)/backend/utils/error/elog_mock.o \
	$(MOCK_DIR)/backend/utils/mmgr/aset_mock.o \
	$(MOCK_DIR)/backend/utils/mmgr/mcxt_mock.o \
	$(MOCK_DIR)/backend/utils/mmgr/memprot_mock.o \
	$(MOCK_DIR)/backend/utils/mmgr/vmem_tracker_mock.o\
	$(MOCK_DIR)/backend/access/hash/hash_mock.o\
	$(MOCK_DIR)/backend/utils/fmgr/fmgr_mock.o


runaway_cleaner.t: \
	$(MOCK_DIR)/backend/utils/error/elog_mock.o \
	$(MOCK_DIR)/backend/access/transam/xact_mock.o \
	$(MOCK_DIR)/backend/utils/mmgr/mcxt_mock.o \
	$(MOCK_DIR)/backend/utils/misc/faultinjector_mock.o \
	$(MOCK_DIR)/backend/utils/misc/superuser_mock.o \
	$(MOCK_DIR)/backend/utils/mmgr/idle_tracker_mock.o\
	$(MOCK_DIR)/backend/access/hash/hash_mock.o\
	$(MOCK_DIR)/backend/utils/fmgr/fmgr_mock.o

idle_tracker.t: \
	$(MOCK_DIR)/backend/utils/error/assert_mock.o \
	$(MOCK_DIR)/backend/utils/mmgr/runaway_cleaner_mock.o\
	$(MOCK_DIR)/backend/access/hash/hash_mock.o\
	$(MOCK_DIR)/backend/utils/fmgr/fmgr_mock.o

event_version.t: $(MOCK_DIR)/backend/storage/ipc/shmem_mock.o\
	$(MOCK_DIR)/backend/access/hash/hash_mock.o\
	$(MOCK_DIR)/backend/utils/fmgr/fmgr_mock.o

mcxt.t: $(MOCK_DIR)/backend/access/hash/hashpage_mock.o \
	$(MOCK_DIR)/backend/utils/fmgr/fmgr_mock.o
