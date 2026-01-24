Return-Path: <ksummit+bounces-2810-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKiDDN4edGk32QAAu9opvQ
	(envelope-from <ksummit+bounces-2810-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sat, 24 Jan 2026 02:22:38 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C997BEDE
	for <lists@lfdr.de>; Sat, 24 Jan 2026 02:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10EA93019508
	for <lists@lfdr.de>; Sat, 24 Jan 2026 01:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F631F0995;
	Sat, 24 Jan 2026 01:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZqI5CJlU"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F014C27732;
	Sat, 24 Jan 2026 01:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769217704; cv=none; b=BJvUVssyf3emeix0S+92Twl3bzAAgDZjzw8Ivi3oEkTtQY24tVfQNjFu5MYt0DEeVhgXR5jroGKidvMNCftQgH179VFBLlP3DiZxpA4BVsBGsf6WM9oBWM8BAy8JUZpmaWs+lMHWw7Ho430saFQuyUMMzXmMjBHeHJOFkoHj8vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769217704; c=relaxed/simple;
	bh=uJJVg+a/BYrXg+/kiUruYLx01YjvmEYSWxLiJISnL1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ubVQlWZjLnOpmQKzGB0GsctkfMHkDKRwsv8yhdAki7rrw5wxU0T9SYnhiIyf69/1f7cEVGJBiRrq4aS29lODCMGBMDQaNczim0PD1Y1Iie2wGnmYW1yn9gOiXUHNcaMSoJO3Ux+5PAW0sxg7SNSgtnMbQnYbdfnbDa56ZZQ2fPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZqI5CJlU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769217703; x=1800753703;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uJJVg+a/BYrXg+/kiUruYLx01YjvmEYSWxLiJISnL1Q=;
  b=ZqI5CJlUP675tYnMkyYn1EvEM2GLCVSSWBMKMy7EzdMTgh8YPxVk87Jb
   eIC+KRgCYBFxOFtqdKJHO6FWOPypmOFtRHIgw95x81BkjMqfxbkejrrsb
   +gw94RqFJKRBTmJ4i8zE0tnGT8wC7YxJ+t1zsaKt+QYfgnwNL14dtvg+o
   fji1R+kkGl1AyvTqaYXAybdGyGkfZYJ19F0Eqs1Nr04UjsEilIKt/YHuq
   WM69xp7S/MBLAxppJTBsWGHvA9F5voavXt7p+6tXek7Vo7uh2gUbjtYAu
   HRbzrVujSeeF8A3mQ5SLBUh4UK3VcvU1zqabPY5eumd1Bs11O99stvnYf
   g==;
X-CSE-ConnectionGUID: fm9jjxoZRg++4cWttUgSgw==
X-CSE-MsgGUID: 0b4uWEo/Q5u1+QHQLsDHJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="88048347"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="88048347"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 17:21:42 -0800
X-CSE-ConnectionGUID: zFeBk/u0Si6dgKj47j2J+Q==
X-CSE-MsgGUID: 1W+EXFDLTDmnsmHZ2bg0eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="206975704"
Received: from dwillia2-desk.jf.intel.com ([10.88.27.145])
  by orviesa009.jf.intel.com with ESMTP; 23 Jan 2026 17:21:43 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: corbet@lwn.net
Cc: ksummit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	tech-board-discuss@lists.linux.dev,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH] Documentation: Project continuity
Date: Fri, 23 Jan 2026 17:22:56 -0800
Message-ID: <20260124012256.1856709-1-dan.j.williams@intel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2810-lists=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.j.williams@intel.com,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,linux.dev:email,lwn.net:url,lwn.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-foundation.org:email,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 82C997BEDE
X-Rspamd-Action: no action

Document project continuity procedures. This is a plan for a plan for
navigating events that affect the forward progress of the canonical Linux
repository, torvalds/linux.git. It is a follow-up from Maintainer Summit
[1].

Cc: Linus Torvalds <torvalds@linux-foundation.org>
Co-developed-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Kees Cook <kees@kernel.org>
Link: https://lwn.net/Articles/1050179/ [1]
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 Documentation/process/conclave.rst | 41 ++++++++++++++++++++++++++++++
 Documentation/process/index.rst    |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 Documentation/process/conclave.rst

diff --git a/Documentation/process/conclave.rst b/Documentation/process/conclave.rst
new file mode 100644
index 000000000000..6a1234f54612
--- /dev/null
+++ b/Documentation/process/conclave.rst
@@ -0,0 +1,41 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Linux kernel project continuity
+===============================
+
+The Linux kernel development project is widely distributed, with over
+100 maintainers each working to keep changes moving through their own
+repositories. The final step, though, is a centralized one where changes
+are pulled into the mainline repository. That is normally done by Linus
+Torvalds but, as was demonstrated by the 4.19 release in 2018, there are
+others who can do that work when the need arises.
+
+Should the maintainers of that repository become unwilling or unable to
+do that work going forward (including facilitating a transition), the
+project will need to find one or more replacements without delay. The
+process by which that will be done is listed below. $ORGANIZER is the
+last Maintainer Summit organizer or the current Linux Foundation (LF)
+Technical Advisory Board (TAB) Chair as a backup.
+
+- Within 72 hours, $ORGANIZER will open a discussion with the invitees
+  of the most recently concluded Maintainers Summit. A meeting of those
+  invitees and the TAB, either online or in-person, will be set as soon
+  as possible in a way that maximizes the number of people who can
+  participate.
+
+- If there has been no Maintainers Summit in the last 15 months, the set of
+  invitees for this meeting will be determined by the TAB.
+
+- The invitees to this meeting may bring in other maintainers as needed.
+
+- This meeting, chaired by $ORGANIZER, will consider options for the
+  ongoing management of the top-level kernel repository consistent with
+  the expectation that it maximizes the long term health of the project
+  and its community.
+
+- Within two weeks, a representative of this group will communicate to the
+  broader community, using the ksummit@lists.linux.dev mailing list, what
+  the next steps will be.
+
+The Linux Foundation, as guided by the TAB, will take the steps
+necessary to support and implement this plan.
diff --git a/Documentation/process/index.rst b/Documentation/process/index.rst
index aa12f2660194..492b808a6977 100644
--- a/Documentation/process/index.rst
+++ b/Documentation/process/index.rst
@@ -68,6 +68,7 @@ beyond).
    stable-kernel-rules
    management-style
    researcher-guidelines
+   conclave
 
 Dealing with bugs
 -----------------

base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
-- 
2.52.0


