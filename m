Return-Path: <ksummit+bounces-2868-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gP/iEKz6pWmvIgAAu9opvQ
	(envelope-from <ksummit+bounces-2868-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Mon, 02 Mar 2026 22:01:32 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C711E1721
	for <lists@lfdr.de>; Mon, 02 Mar 2026 22:01:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DD8D319F5F3
	for <lists@lfdr.de>; Mon,  2 Mar 2026 20:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BFF548165A;
	Mon,  2 Mar 2026 20:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9ljg58h"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3B5481653
	for <ksummit@lists.linux.dev>; Mon,  2 Mar 2026 20:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772483320; cv=none; b=sGevQ32ZZXVNZHmxQy8tzEIHdHUUtnEW837rBkZtGNVbIY4dnNa+eIcHVK5xpACc2bYEdDPWdh4y6lcYdT8x7fQqhHMxAJqWlU3w5lKw6VGOZssIG1bVLadB/tduJcwPc3ALjSkfdFKmm182/t5JbT6zNwOE5XoOuHW7jYZCiHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772483320; c=relaxed/simple;
	bh=6XCX7s+KSpEdCZxnvkcwSQs/mQrnqj8x5cR/VrTUr0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IgNN9vcjI3MMgTJuUsfwRQV8+s1LV/JyxIqoAczuBMNwZc8ESEKR8bL0oNMEkUw3Hn33RORrbSqr2peC4WgAk2PKTZYAXTzTDP4De9xQbJt5tkGhApajjehqsh1qZglttHUpn1Qv/7/KF5naB2J2azxPA1273b/VT/rpmPutz30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9ljg58h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09AD4C2BC9E;
	Mon,  2 Mar 2026 20:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772483320;
	bh=6XCX7s+KSpEdCZxnvkcwSQs/mQrnqj8x5cR/VrTUr0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h9ljg58hL+V4NXLSBS5Y8zZY34iX1tc251R6hYUL+YE0Nha/sgZC2BtDOlvqZPf1N
	 1MotjNkTNq77+l/USvk3MsqX5E+hGi4TBYapenhuks1/ZAMYhWWd5sVD8SfbDHl+YZ
	 QN1Npn4AtmYWj8d35QxbEV1N8VfXPjf06TI0w7/zEWRgzUbBJ+VivrtcuMNdWGFrPn
	 JlRxEB17B2xJBBKzn5RA3pGeuiNA2PstTWZhYfcc19TMFhMVzR1LmKhr87pS3PP6l7
	 kQJTc9LyYFn3N5Yq0nDJJEiByCB8mGa/gHKwIvbuFByXweS3jsf+tM32Nmkgu1WjpL
	 lO9sLJ7spOOqQ==
From: Sasha Levin <sashal@kernel.org>
To: torvalds@linuxfoundation.org
Cc: akpm@linux-foundation.org,
	geert@linux-m68k.org,
	konstantin@linuxfoundation.org,
	ksummit@lists.linux.dev,
	laurent.pinchart@ideasonboard.com,
	linux@leemhuis.info,
	richard@nod.at,
	rostedt@goodmis.org,
	sashal@kernel.org,
	users@kernel.org
Subject: [RFC] kallsyms: embed source file:line info in kernel stack traces
Date: Mon,  2 Mar 2026 15:28:28 -0500
Message-ID: <20260302202828.2722037-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <CAHk-=wiUOYn4nyWyuvLh1O0j2reB_ec+4DAO06h7Pu36aA4iDg@mail.gmail.com>
References: <CAHk-=wiUOYn4nyWyuvLh1O0j2reB_ec+4DAO06h7Pu36aA4iDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 99C711E1721
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,ksummit@lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-2868-lists=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Add CONFIG_KALLSYMS_LINEINFO, which embeds a compact address-to-line
lookup table in the kernel image so stack traces directly print source
file and line number information:

  root@localhost:~# echo c > /proc/sysrq-trigger
  [   11.201987] sysrq: Trigger a crash
  [   11.202831] Kernel panic - not syncing: sysrq triggered crash
  [   11.206218] Call Trace:
  [   11.206501]  <TASK>
  [   11.206749]  dump_stack_lvl+0x5d/0x80 (lib/dump_stack.c:94)
  [   11.207403]  vpanic+0x36e/0x620 (kernel/panic.c:650)
  [   11.208565]  ? __lock_acquire+0x465/0x2240 (kernel/locking/lockdep.c:4674)
  [   11.209324]  panic+0xc9/0xd0 (kernel/panic.c:787)
  [   11.211873]  ? find_held_lock+0x2b/0x80 (kernel/locking/lockdep.c:5350)
  [   11.212597]  ? lock_release+0xd3/0x300 (kernel/locking/lockdep.c:5535)
  [   11.213312]  sysrq_handle_crash+0x1a/0x20 (drivers/tty/sysrq.c:154)
  [   11.214005]  __handle_sysrq.cold+0x66/0x256 (drivers/tty/sysrq.c:611)
  [   11.214712]  write_sysrq_trigger+0x65/0x80 (drivers/tty/sysrq.c:1221)
  [   11.215424]  proc_reg_write+0x1bd/0x3c0 (fs/proc/inode.c:330)
  [   11.216061]  vfs_write+0x1c6/0xff0 (fs/read_write.c:686)
  [   11.218848]  ksys_write+0xfa/0x200 (fs/read_write.c:740)
  [   11.222394]  do_syscall_64+0xf3/0x690 (arch/x86/entry/syscall_64.c:63)
  [   11.223942]  entry_SYSCALL_64_after_hwframe+0x77/0x7f (arch/x86/entry/entry_64.S:121)

At build time, a new host tool (scripts/gen_lineinfo) reads DWARF
.debug_line from vmlinux using libdw (elfutils), extracts all
address-to-file:line mappings, and generates an assembly file with
sorted parallel arrays (offsets from _text, file IDs, and line
numbers). These are linked into vmlinux as .rodata.

At runtime, kallsyms_lookup_lineinfo() does a binary search on the
table and __sprint_symbol() appends "(file:line)" to each stack frame.
The lookup uses offsets from _text so it works with KASLR, requires no
locks or allocations, and is safe in any context including panic.

The feature requires CONFIG_DEBUG_INFO (for DWARF data) and
elfutils (libdw-dev) on the build host.

Memory footprint measured with a simple KVM guest x86_64 config:

  Table: 4,597,583 entries from 4,841 source files
    lineinfo_addrs[]     4,597,583 x u32  = 17.5 MiB
    lineinfo_file_ids[]  4,597,583 x u16  =  8.8 MiB
    lineinfo_lines[]     4,597,583 x u32  = 17.5 MiB
    file_offsets + filenames              ~  0.1 MiB
    Total .rodata increase:              ~ 44.0 MiB

  vmlinux (stripped):  529 MiB -> 573 MiB  (+44 MiB / +8.3%)

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/linux/kallsyms.h   |  23 ++-
 init/Kconfig               |  20 ++
 kernel/kallsyms.c          |  52 +++++
 kernel/kallsyms_internal.h |  10 +
 scripts/Makefile           |   3 +
 scripts/gen_lineinfo.c     | 403 +++++++++++++++++++++++++++++++++++++
 scripts/kallsyms.c         |  16 ++
 scripts/link-vmlinux.sh    |  66 +++++-
 8 files changed, 589 insertions(+), 4 deletions(-)
 create mode 100644 scripts/gen_lineinfo.c

diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
index d5dd54c53ace6..5516a4fef4cbc 100644
--- a/include/linux/kallsyms.h
+++ b/include/linux/kallsyms.h
@@ -16,10 +16,19 @@
 #include <asm/sections.h>
 
 #define KSYM_NAME_LEN 512
+
+#ifdef CONFIG_KALLSYMS_LINEINFO
+/* Extra space for " (path/to/file.c:12345)" suffix */
+#define KSYM_LINEINFO_LEN 80
+#else
+#define KSYM_LINEINFO_LEN 0
+#endif
+
 #define KSYM_SYMBOL_LEN (sizeof("%s+%#lx/%#lx [%s %s]") + \
 			(KSYM_NAME_LEN - 1) + \
 			2*(BITS_PER_LONG*3/10) + (MODULE_NAME_LEN - 1) + \
-			(BUILD_ID_SIZE_MAX * 2) + 1)
+			(BUILD_ID_SIZE_MAX * 2) + 1 + \
+			KSYM_LINEINFO_LEN)
 
 struct cred;
 struct module;
@@ -96,6 +105,18 @@ extern int sprint_backtrace_build_id(char *buffer, unsigned long address);
 
 int lookup_symbol_name(unsigned long addr, char *symname);
 
+#ifdef CONFIG_KALLSYMS_LINEINFO
+bool kallsyms_lookup_lineinfo(unsigned long addr, const char **file,
+			      unsigned int *line);
+#else
+static inline bool kallsyms_lookup_lineinfo(unsigned long addr,
+					    const char **file,
+					    unsigned int *line)
+{
+	return false;
+}
+#endif
+
 #else /* !CONFIG_KALLSYMS */
 
 static inline unsigned long kallsyms_lookup_name(const char *name)
diff --git a/init/Kconfig b/init/Kconfig
index b55deae9256c7..c39f27e6393a8 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2050,6 +2050,26 @@ config KALLSYMS_ALL
 
 	  Say N unless you really need all symbols, or kernel live patching.
 
+config KALLSYMS_LINEINFO
+	bool "Embed source file:line information in stack traces"
+	depends on KALLSYMS && DEBUG_INFO
+	help
+	  Embeds an address-to-source-line mapping table in the kernel
+	  image so that stack traces directly include file:line information,
+	  similar to what scripts/decode_stacktrace.sh provides but without
+	  needing external tools or a vmlinux with debug info at runtime.
+
+	  When enabled, stack traces will look like:
+
+	    kmem_cache_alloc_noprof+0x60/0x630 (mm/slub.c:3456)
+	    anon_vma_clone+0x2ed/0xcf0 (mm/rmap.c:412)
+
+	  This requires elfutils (libdw-dev/elfutils-devel) on the build host.
+	  Adds approximately 44MB to a typical kernel image (10 bytes per
+	  DWARF line-table entry, ~4.6M entries for a typical config).
+
+	  If unsure, say N.
+
 # end of the "standard kernel features (expert users)" menu
 
 config ARCH_HAS_MEMBARRIER_CALLBACKS
diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index aec2f06858afd..fbe8e0a845ab5 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -467,6 +467,47 @@ static int append_buildid(char *buffer,   const char *modname,
 
 #endif /* CONFIG_STACKTRACE_BUILD_ID */
 
+#ifdef CONFIG_KALLSYMS_LINEINFO
+bool kallsyms_lookup_lineinfo(unsigned long addr, const char **file,
+			      unsigned int *line)
+{
+	unsigned int offset, low, high, mid, file_id;
+
+	if (!lineinfo_num_entries)
+		return false;
+
+	/* Compute offset from _text */
+	if (addr < (unsigned long)_text)
+		return false;
+
+	offset = (unsigned int)(addr - (unsigned long)_text);
+
+	/* Binary search for largest entry <= offset */
+	low = 0;
+	high = lineinfo_num_entries;
+	while (low < high) {
+		mid = low + (high - low) / 2;
+		if (lineinfo_addrs[mid] <= offset)
+			low = mid + 1;
+		else
+			high = mid;
+	}
+
+	if (low == 0)
+		return false;
+	low--;
+
+	file_id = lineinfo_file_ids[low];
+	*line = lineinfo_lines[low];
+
+	if (file_id >= lineinfo_num_files)
+		return false;
+
+	*file = &lineinfo_filenames[lineinfo_file_offsets[file_id]];
+	return true;
+}
+#endif /* CONFIG_KALLSYMS_LINEINFO */
+
 /* Look up a kernel symbol and return it in a text buffer. */
 static int __sprint_symbol(char *buffer, unsigned long address,
 			   int symbol_offset, int add_offset, int add_buildid)
@@ -497,6 +538,17 @@ static int __sprint_symbol(char *buffer, unsigned long address,
 		len += sprintf(buffer + len, "]");
 	}
 
+#ifdef CONFIG_KALLSYMS_LINEINFO
+	{
+		const char *li_file;
+		unsigned int li_line;
+
+		if (kallsyms_lookup_lineinfo(address, &li_file, &li_line))
+			len += sprintf(buffer + len, " (%s:%u)", li_file,
+				       li_line);
+	}
+#endif
+
 	return len;
 }
 
diff --git a/kernel/kallsyms_internal.h b/kernel/kallsyms_internal.h
index 81a867dbe57d4..868a1d5035212 100644
--- a/kernel/kallsyms_internal.h
+++ b/kernel/kallsyms_internal.h
@@ -15,4 +15,14 @@ extern const u16 kallsyms_token_index[];
 extern const unsigned int kallsyms_markers[];
 extern const u8 kallsyms_seqs_of_names[];
 
+#ifdef CONFIG_KALLSYMS_LINEINFO
+extern const u32 lineinfo_num_entries;
+extern const u32 lineinfo_addrs[];
+extern const u16 lineinfo_file_ids[];
+extern const u32 lineinfo_lines[];
+extern const u32 lineinfo_num_files;
+extern const u32 lineinfo_file_offsets[];
+extern const char lineinfo_filenames[];
+#endif
+
 #endif // LINUX_KALLSYMS_INTERNAL_H_
diff --git a/scripts/Makefile b/scripts/Makefile
index 0941e5ce7b575..ffe89875b3295 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -4,6 +4,7 @@
 # the kernel for the build process.
 
 hostprogs-always-$(CONFIG_KALLSYMS)			+= kallsyms
+hostprogs-always-$(CONFIG_KALLSYMS_LINEINFO)		+= gen_lineinfo
 hostprogs-always-$(BUILD_C_RECORDMCOUNT)		+= recordmcount
 hostprogs-always-$(CONFIG_BUILDTIME_TABLE_SORT)		+= sorttable
 hostprogs-always-$(CONFIG_ASN1)				+= asn1_compiler
@@ -36,6 +37,8 @@ HOSTLDLIBS_sorttable = -lpthread
 HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
 HOSTCFLAGS_sign-file.o = $(shell $(HOSTPKG_CONFIG) --cflags libcrypto 2> /dev/null)
 HOSTLDLIBS_sign-file = $(shell $(HOSTPKG_CONFIG) --libs libcrypto 2> /dev/null || echo -lcrypto)
+HOSTCFLAGS_gen_lineinfo.o = $(shell $(HOSTPKG_CONFIG) --cflags libdw 2> /dev/null)
+HOSTLDLIBS_gen_lineinfo = $(shell $(HOSTPKG_CONFIG) --libs libdw 2> /dev/null || echo -ldw -lelf -lz)
 
 ifdef CONFIG_UNWINDER_ORC
 ifeq ($(ARCH),x86_64)
diff --git a/scripts/gen_lineinfo.c b/scripts/gen_lineinfo.c
new file mode 100644
index 0000000000000..c4b1f6ae54a8a
--- /dev/null
+++ b/scripts/gen_lineinfo.c
@@ -0,0 +1,403 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * gen_lineinfo.c - Generate address-to-source-line lookup tables from DWARF
+ *
+ * Copyright (C) 2026 Sasha Levin <sashal@kernel.org>
+ *
+ * Reads DWARF .debug_line from a vmlinux ELF file and outputs an assembly
+ * file containing sorted lookup tables that the kernel uses to annotate
+ * stack traces with source file:line information.
+ *
+ * Requires libdw from elfutils.
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <elfutils/libdw.h>
+#include <dwarf.h>
+#include <elf.h>
+#include <gelf.h>
+
+struct line_entry {
+	unsigned int offset;	/* offset from _text */
+	unsigned int file_id;
+	unsigned int line;
+};
+
+struct file_entry {
+	char *name;
+	unsigned int id;
+	unsigned int str_offset;
+};
+
+static struct line_entry *entries;
+static unsigned int num_entries;
+static unsigned int entries_capacity;
+
+static struct file_entry *files;
+static unsigned int num_files;
+static unsigned int files_capacity;
+
+static void add_entry(unsigned int offset, unsigned int file_id,
+		      unsigned int line)
+{
+	if (num_entries >= entries_capacity) {
+		entries_capacity = entries_capacity ? entries_capacity * 2 : 65536;
+		entries = realloc(entries, entries_capacity * sizeof(*entries));
+		if (!entries) {
+			fprintf(stderr, "out of memory\n");
+			exit(1);
+		}
+	}
+	entries[num_entries].offset = offset;
+	entries[num_entries].file_id = file_id;
+	entries[num_entries].line = line;
+	num_entries++;
+}
+
+static unsigned int find_or_add_file(const char *name)
+{
+	unsigned int i;
+
+	for (i = 0; i < num_files; i++) {
+		if (!strcmp(files[i].name, name))
+			return files[i].id;
+	}
+
+	if (num_files >= files_capacity) {
+		files_capacity = files_capacity ? files_capacity * 2 : 4096;
+		files = realloc(files, files_capacity * sizeof(*files));
+		if (!files) {
+			fprintf(stderr, "out of memory\n");
+			exit(1);
+		}
+	}
+	files[num_files].name = strdup(name);
+	files[num_files].id = num_files;
+	num_files++;
+
+	return num_files - 1;
+}
+
+/*
+ * Strip a filename to a kernel-relative path.
+ * If the path contains a known kernel directory prefix, strip up to it.
+ * Otherwise return the basename.
+ */
+static const char *make_relative(const char *path, const char *comp_dir)
+{
+	const char *p;
+	static char buf[4096];
+
+	/* If already relative, use as-is */
+	if (path[0] != '/')
+		return path;
+
+	/* Look for common kernel source tree markers */
+	static const char * const markers[] = {
+		"/kernel/", "/mm/", "/fs/", "/net/", "/drivers/",
+		"/arch/", "/include/", "/lib/", "/init/", "/ipc/",
+		"/security/", "/crypto/", "/block/", "/sound/",
+		"/tools/", "/virt/", "/samples/", "/rust/",
+		"/io_uring/", "/certs/", "/usr/",
+	};
+
+	for (unsigned int i = 0; i < sizeof(markers) / sizeof(markers[0]); i++) {
+		p = strstr(path, markers[i]);
+		if (p) {
+			/* Return from the component after the leading / */
+			return p + 1;
+		}
+	}
+
+	/*
+	 * If comp_dir is set and the path starts with it, strip that prefix.
+	 */
+	if (comp_dir) {
+		size_t len = strlen(comp_dir);
+
+		if (!strncmp(path, comp_dir, len) && path[len] == '/')
+			return path + len + 1;
+	}
+
+	/* Last resort: return the basename */
+	p = strrchr(path, '/');
+	if (p)
+		return p + 1;
+
+	snprintf(buf, sizeof(buf), "%s", path);
+	return buf;
+}
+
+static int compare_entries(const void *a, const void *b)
+{
+	const struct line_entry *ea = a;
+	const struct line_entry *eb = b;
+
+	if (ea->offset < eb->offset)
+		return -1;
+	if (ea->offset > eb->offset)
+		return 1;
+	return 0;
+}
+
+static unsigned long long find_text_addr(Elf *elf)
+{
+	size_t nsyms, i;
+	Elf_Scn *scn = NULL;
+	GElf_Shdr shdr;
+
+	while ((scn = elf_nextscn(elf, scn)) != NULL) {
+		Elf_Data *data;
+
+		if (!gelf_getshdr(scn, &shdr))
+			continue;
+		if (shdr.sh_type != SHT_SYMTAB)
+			continue;
+
+		data = elf_getdata(scn, NULL);
+		if (!data)
+			continue;
+
+		nsyms = shdr.sh_size / shdr.sh_entsize;
+		for (i = 0; i < nsyms; i++) {
+			GElf_Sym sym;
+			const char *name;
+
+			if (!gelf_getsym(data, i, &sym))
+				continue;
+			name = elf_strptr(elf, shdr.sh_link, sym.st_name);
+			if (name && !strcmp(name, "_text"))
+				return sym.st_value;
+		}
+	}
+
+	fprintf(stderr, "Cannot find _text symbol\n");
+	exit(1);
+}
+
+static void process_dwarf(Dwarf *dwarf, unsigned long long text_addr)
+{
+	Dwarf_Off off = 0, next_off;
+	size_t hdr_size;
+
+	while (dwarf_nextcu(dwarf, off, &next_off, &hdr_size,
+			    NULL, NULL, NULL) == 0) {
+		Dwarf_Die cudie;
+		Dwarf_Lines *lines;
+		size_t nlines;
+		Dwarf_Attribute attr;
+		const char *comp_dir = NULL;
+
+		if (!dwarf_offdie(dwarf, off + hdr_size, &cudie))
+			goto next;
+
+		if (dwarf_attr(&cudie, DW_AT_comp_dir, &attr))
+			comp_dir = dwarf_formstring(&attr);
+
+		if (dwarf_getsrclines(&cudie, &lines, &nlines) != 0)
+			goto next;
+
+		for (size_t i = 0; i < nlines; i++) {
+			Dwarf_Line *line = dwarf_onesrcline(lines, i);
+			Dwarf_Addr addr;
+			const char *src;
+			const char *rel;
+			unsigned int file_id, loffset;
+			int lineno;
+
+			if (!line)
+				continue;
+
+			if (dwarf_lineaddr(line, &addr) != 0)
+				continue;
+			if (dwarf_lineno(line, &lineno) != 0)
+				continue;
+			if (lineno == 0)
+				continue;
+
+			src = dwarf_linesrc(line, NULL, NULL);
+			if (!src)
+				continue;
+
+			if (addr < text_addr)
+				continue;
+
+			rel = make_relative(src, comp_dir);
+			file_id = find_or_add_file(rel);
+			loffset = (unsigned int)(addr - text_addr);
+
+			add_entry(loffset, file_id, (unsigned int)lineno);
+		}
+next:
+		off = next_off;
+	}
+}
+
+static void deduplicate(void)
+{
+	unsigned int i, j;
+
+	if (num_entries < 2)
+		return;
+
+	/* Sort by offset */
+	qsort(entries, num_entries, sizeof(*entries), compare_entries);
+
+	/*
+	 * Remove consecutive entries with the same file_id and line.
+	 * In a sorted array used for binary search (find largest entry
+	 * <= target), consecutive entries mapping to the same file:line
+	 * are redundant -- any address between them resolves to the
+	 * earlier entry.
+	 */
+	j = 0;
+	for (i = 1; i < num_entries; i++) {
+		if (entries[i].file_id == entries[j].file_id &&
+		    entries[i].line == entries[j].line)
+			continue;
+		j++;
+		if (j != i)
+			entries[j] = entries[i];
+	}
+	num_entries = j + 1;
+}
+
+static void compute_file_offsets(void)
+{
+	unsigned int offset = 0;
+
+	for (unsigned int i = 0; i < num_files; i++) {
+		files[i].str_offset = offset;
+		offset += strlen(files[i].name) + 1;
+	}
+}
+
+static void output_assembly(void)
+{
+	printf("/* SPDX-License-Identifier: GPL-2.0 */\n");
+	printf("/*\n");
+	printf(" * Automatically generated by scripts/gen_lineinfo\n");
+	printf(" * Do not edit.\n");
+	printf(" */\n\n");
+
+	printf("\t.section .rodata, \"a\"\n\n");
+
+	/* Number of entries */
+	printf("\t.globl lineinfo_num_entries\n");
+	printf("\t.balign 4\n");
+	printf("lineinfo_num_entries:\n");
+	printf("\t.long %u\n\n", num_entries);
+
+	/* Number of files */
+	printf("\t.globl lineinfo_num_files\n");
+	printf("\t.balign 4\n");
+	printf("lineinfo_num_files:\n");
+	printf("\t.long %u\n\n", num_files);
+
+	/* Sorted address offsets from _text */
+	printf("\t.globl lineinfo_addrs\n");
+	printf("\t.balign 4\n");
+	printf("lineinfo_addrs:\n");
+	for (unsigned int i = 0; i < num_entries; i++)
+		printf("\t.long 0x%x\n", entries[i].offset);
+	printf("\n");
+
+	/* File IDs, parallel to addrs (u16 -- supports up to 65535 files) */
+	printf("\t.globl lineinfo_file_ids\n");
+	printf("\t.balign 2\n");
+	printf("lineinfo_file_ids:\n");
+	for (unsigned int i = 0; i < num_entries; i++)
+		printf("\t.short %u\n", entries[i].file_id);
+	printf("\n");
+
+	/* Line numbers, parallel to addrs */
+	printf("\t.globl lineinfo_lines\n");
+	printf("\t.balign 4\n");
+	printf("lineinfo_lines:\n");
+	for (unsigned int i = 0; i < num_entries; i++)
+		printf("\t.long %u\n", entries[i].line);
+	printf("\n");
+
+	/* File string offset table */
+	printf("\t.globl lineinfo_file_offsets\n");
+	printf("\t.balign 4\n");
+	printf("lineinfo_file_offsets:\n");
+	for (unsigned int i = 0; i < num_files; i++)
+		printf("\t.long %u\n", files[i].str_offset);
+	printf("\n");
+
+	/* Concatenated NUL-terminated filenames */
+	printf("\t.globl lineinfo_filenames\n");
+	printf("lineinfo_filenames:\n");
+	for (unsigned int i = 0; i < num_files; i++)
+		printf("\t.asciz \"%s\"\n", files[i].name);
+	printf("\n");
+}
+
+int main(int argc, char *argv[])
+{
+	int fd;
+	Elf *elf;
+	Dwarf *dwarf;
+	unsigned long long text_addr;
+
+	if (argc != 2) {
+		fprintf(stderr, "Usage: %s <vmlinux>\n", argv[0]);
+		return 1;
+	}
+
+	fd = open(argv[1], O_RDONLY);
+	if (fd < 0) {
+		fprintf(stderr, "Cannot open %s: %s\n", argv[1],
+			strerror(errno));
+		return 1;
+	}
+
+	elf_version(EV_CURRENT);
+	elf = elf_begin(fd, ELF_C_READ, NULL);
+	if (!elf) {
+		fprintf(stderr, "elf_begin failed: %s\n",
+			elf_errmsg(elf_errno()));
+		close(fd);
+		return 1;
+	}
+
+	text_addr = find_text_addr(elf);
+
+	dwarf = dwarf_begin_elf(elf, DWARF_C_READ, NULL);
+	if (!dwarf) {
+		fprintf(stderr, "dwarf_begin_elf failed: %s\n",
+			dwarf_errmsg(dwarf_errno()));
+		fprintf(stderr, "Is %s built with CONFIG_DEBUG_INFO?\n",
+			argv[1]);
+		elf_end(elf);
+		close(fd);
+		return 1;
+	}
+
+	process_dwarf(dwarf, text_addr);
+	deduplicate();
+	compute_file_offsets();
+
+	fprintf(stderr, "lineinfo: %u entries, %u files\n",
+		num_entries, num_files);
+
+	output_assembly();
+
+	dwarf_end(dwarf);
+	elf_end(elf);
+	close(fd);
+
+	/* Cleanup */
+	free(entries);
+	for (unsigned int i = 0; i < num_files; i++)
+		free(files[i].name);
+	free(files);
+
+	return 0;
+}
diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 37d5c095ad22a..42662c4fbc6c9 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -78,6 +78,17 @@ static char *sym_name(const struct sym_entry *s)
 
 static bool is_ignored_symbol(const char *name, char type)
 {
+	/* Ignore lineinfo symbols for kallsyms pass stability */
+	static const char * const lineinfo_syms[] = {
+		"lineinfo_addrs",
+		"lineinfo_file_ids",
+		"lineinfo_file_offsets",
+		"lineinfo_filenames",
+		"lineinfo_lines",
+		"lineinfo_num_entries",
+		"lineinfo_num_files",
+	};
+
 	if (type == 'u' || type == 'n')
 		return true;
 
@@ -90,6 +101,11 @@ static bool is_ignored_symbol(const char *name, char type)
 			return true;
 	}
 
+	for (size_t i = 0; i < ARRAY_SIZE(lineinfo_syms); i++) {
+		if (!strcmp(name, lineinfo_syms[i]))
+			return true;
+	}
+
 	return false;
 }
 
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index f99e196abeea4..640209f2e9eb9 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -103,7 +103,7 @@ vmlinux_link()
 	${ld} ${ldflags} -o ${output}					\
 		${wl}--whole-archive ${objs} ${wl}--no-whole-archive	\
 		${wl}--start-group ${libs} ${wl}--end-group		\
-		${kallsymso} ${btf_vmlinux_bin_o} ${arch_vmlinux_o} ${ldlibs}
+		${kallsymso} ${lineinfo_o} ${btf_vmlinux_bin_o} ${arch_vmlinux_o} ${ldlibs}
 }
 
 # Create ${2}.o file with all symbols from the ${1} object file
@@ -129,6 +129,26 @@ kallsyms()
 	kallsymso=${2}.o
 }
 
+# Generate lineinfo tables from DWARF debug info in a temporary vmlinux.
+# ${1} - temporary vmlinux with debug info
+# Output: sets lineinfo_o to the generated .o file
+gen_lineinfo()
+{
+	info LINEINFO .tmp_lineinfo.S
+	if ! scripts/gen_lineinfo "${1}" > .tmp_lineinfo.S; then
+		echo >&2 "Failed to generate lineinfo from ${1}"
+		echo >&2 "Try to disable CONFIG_KALLSYMS_LINEINFO"
+		exit 1
+	fi
+
+	info AS .tmp_lineinfo.o
+	${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
+	      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} \
+	      -c -o .tmp_lineinfo.o .tmp_lineinfo.S
+
+	lineinfo_o=.tmp_lineinfo.o
+}
+
 # Perform kallsyms for the given temporary vmlinux.
 sysmap_and_kallsyms()
 {
@@ -155,6 +175,7 @@ sorttable()
 cleanup()
 {
 	rm -f .btf.*
+	rm -f .tmp_lineinfo.*
 	rm -f .tmp_vmlinux.nm-sort
 	rm -f System.map
 	rm -f vmlinux
@@ -183,6 +204,7 @@ fi
 btf_vmlinux_bin_o=
 btfids_vmlinux=
 kallsymso=
+lineinfo_o=
 strip_debug=
 generate_map=
 
@@ -198,10 +220,44 @@ if is_enabled CONFIG_KALLSYMS; then
 	kallsyms .tmp_vmlinux0.syms .tmp_vmlinux0.kallsyms
 fi
 
+if is_enabled CONFIG_KALLSYMS_LINEINFO; then
+	# Generate a dummy empty lineinfo object for the initial link,
+	# same pattern as the dummy kallsyms above.  The real lineinfo
+	# is generated from .tmp_vmlinux1 after it has been linked with
+	# debug info.
+	cat > .tmp_lineinfo.S <<'EOAS'
+	.section .rodata, "a"
+	.globl lineinfo_num_entries
+	.balign 4
+lineinfo_num_entries:
+	.long 0
+	.globl lineinfo_num_files
+	.balign 4
+lineinfo_num_files:
+	.long 0
+	.globl lineinfo_addrs
+lineinfo_addrs:
+	.globl lineinfo_file_ids
+lineinfo_file_ids:
+	.globl lineinfo_lines
+lineinfo_lines:
+	.globl lineinfo_file_offsets
+lineinfo_file_offsets:
+	.globl lineinfo_filenames
+lineinfo_filenames:
+EOAS
+	${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
+	      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} \
+	      -c -o .tmp_lineinfo.o .tmp_lineinfo.S
+	lineinfo_o=.tmp_lineinfo.o
+fi
+
 if is_enabled CONFIG_KALLSYMS || is_enabled CONFIG_DEBUG_INFO_BTF; then
 
-	# The kallsyms linking does not need debug symbols, but the BTF does.
-	if ! is_enabled CONFIG_DEBUG_INFO_BTF; then
+	# The kallsyms linking does not need debug symbols, but BTF and
+	# lineinfo generation do.
+	if ! is_enabled CONFIG_DEBUG_INFO_BTF &&
+	   ! is_enabled CONFIG_KALLSYMS_LINEINFO; then
 		strip_debug=1
 	fi
 
@@ -219,6 +275,10 @@ if is_enabled CONFIG_DEBUG_INFO_BTF; then
 	btfids_vmlinux=.tmp_vmlinux1.BTF_ids
 fi
 
+if is_enabled CONFIG_KALLSYMS_LINEINFO; then
+	gen_lineinfo .tmp_vmlinux1
+fi
+
 if is_enabled CONFIG_KALLSYMS; then
 
 	# kallsyms support
-- 
2.51.0


