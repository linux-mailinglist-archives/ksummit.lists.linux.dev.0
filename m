Return-Path: <ksummit+bounces-2426-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BD044BB7392
	for <lists@lfdr.de>; Fri, 03 Oct 2025 16:43:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 31AE04E8583
	for <lists@lfdr.de>; Fri,  3 Oct 2025 14:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F384926E6E8;
	Fri,  3 Oct 2025 14:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wolber.net header.i=@wolber.net header.b="QPEO+eJO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jYjEi0GG"
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B0439FD9
	for <ksummit@lists.linux.dev>; Fri,  3 Oct 2025 14:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759502631; cv=none; b=FfF1QWhNA8Aq1PeHxlrE6Vp6L1UQb1SY1Cw2ePZmVSMFhp/wUTvTGX/zAhnn8r4GrcWLu/27N8yIjhbHviaRHQDzHf/GtJcz8P3s3h+KQhhbzVhE6L5TMnDAai5afXP4mzO6QG0V9+c8vv4uz7Mf5l0SPBmv1ZRzGSUm8+OL8RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759502631; c=relaxed/simple;
	bh=gsbuNCB+tenAJK3dqz1WlTMyhVWer4S3n04QGtHB+OE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To; b=ibK+eO/VdGw82j7QI0e/yqjjOQJCBz8MV6HJrsdKVkNl9kH5unf1uEtyFAICRjs1d0oJZv47t2fc5bdWoDZSLo5HNqLcfUFS9dYjDm2DWX3uHo6YM8d4Swli8dLB05LF8WATvgEt58akuX8RuKoffDOj+E/7NPA4M8bQcR0x4X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wolber.net; spf=pass smtp.mailfrom=wolber.net; dkim=pass (2048-bit key) header.d=wolber.net header.i=@wolber.net header.b=QPEO+eJO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jYjEi0GG; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wolber.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolber.net
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 60CE21D00143;
	Fri,  3 Oct 2025 10:43:46 -0400 (EDT)
Received: from phl-imap-03 ([10.202.2.93])
  by phl-compute-02.internal (MEProxy); Fri, 03 Oct 2025 10:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolber.net; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1759502626; x=1759589026; bh=gsbuNCB+te
	nAJK3dqz1WlTMyhVWer4S3n04QGtHB+OE=; b=QPEO+eJOpo1ikAVDY1dqG0TwFK
	xrM32V4TXg5ygJ04lCA3CNDRePc2OmeNluUImXr0Djps0efqg7sJIbpfkicnljgX
	rN2mQwLRMgBl6jHF+Bz0bZEW+uk3Se9SdCTjhIfHSE/MCo86DgfcI7dxczTBzqkI
	edSHCnfMSDaXsBPdt2UsH8ElFYppb5vSoYevvxDQxRJl/cqOM1YbXsSAdfREqL6K
	W6k+YoSZqmI/0kSMEB/l27J0XaaECj5DbiCX/0AM2xXCu6YWlXuPJd/RbjtIyxn1
	O22lw6f/vHoR293JI6rDzEPQYpuSrZaxgXRQsZCmQUmDskuqP1GLk1h6m6zA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1759502626; x=1759589026; bh=gsbuNCB+tenAJK3dqz1WlTMyhVWer4S3n04
	QGtHB+OE=; b=jYjEi0GGpSEywwTeKCVp0Cbqp9SFI9o0IufswXTL4bdKA+tovsf
	1uLpYxD+RVQWi/2sXu6T8Jb6420vGi7JYJsn2CtQWTDldJ/FytJhC3KN7Cm9a6VO
	NlwcYwbgLT7cV9Z6FlGTa9fVaV6zmCx/lVrfakpkTtu+3o5dUSWdVmV1MBQZMvWa
	2M5dvWWfLFKpL7MwJlVokbPyijcV0ZDFRsk00d76HRlppvWxQQpT9rSXYTM5oplx
	ZndBAhgpWTX+PC9mUEX823yHJL8Aekdo3LC4Uq5NvRdIwJJQAcgq5renW/MtW18j
	qD1iW3UWVbNMasMLuwkhO/gobw5ys6g4kgQ==
X-ME-Sender: <xms:IeHfaIHSFCcaqS06DF2zQcCAzEjzgH68OncmVFiwqSDGpvsnc2KjLw>
    <xme:IeHfaMJaeCHAHl0HrZknGIbEZYTd8tOe-cM_3ZAr5Oc9PRZNSU42E-S4z9gclTgb7
    UmvcP-6LMRJJPhrkffVCSSqdlLRii_wXzbVuF6b5QZs9CIYgNteRjk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekledujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepofgggfgtfffkuffhvffosehtqhertdertd
    ejnecuhfhrohhmpedfvehhuhgtkhcuhgholhgsvghrfdcuoegthhhutghkseifohhlsggv
    rhdrnhgvtheqnecuggftrfgrthhtvghrnhepgeevfeefudduveeftdekhefghfefvdeiie
    ejvdekudekfeetieetvdevffdtudffnecuffhomhgrihhnpehlphgtrdgvvhgvnhhtshdp
    khgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomheptghhuhgtkhesfiholhgsvghrrdhnvghtpdhnsggprhgtphhtthhopeeg
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehkshhtvgifrghrtheslhhinhhugi
    hfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehkshhumhhmihhtsehlihhsthhs
    rdhlihhnuhigrdguvghvpdhrtghpthhtoheprggtrghrmhhinhgrsehrvgguhhgrthdrtg
    homhdprhgtphhtthhopehgphgrohhlohhnihesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:IeHfaJv-8CCa4bqNoEtkcsQ77kCMrio1Vq5NLyCQg_zLmzHHkczWWg>
    <xmx:IeHfaAS4X4USiKbyIoDLpGnUOBcrgl48TcATHKfr6FqjIAymQFa4PA>
    <xmx:IeHfaHMnBpL9qaqM1nj05xPq_wGtXh0BeZ6b1CPGu6XR7AScexpsmA>
    <xmx:IeHfaNZrqhp1Vt3hx5LPqtnDHy24j4ad0Zgwa5vO6zHKnU_TyK5wkw>
    <xmx:IuHfaJiesDAeuzijlC5psACJCB7DbxBxDxr1RPL4s5qHLA4gNRgmtybs>
Feedback-ID: i5cf64821:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C1E9918E0071; Fri,  3 Oct 2025 10:43:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Oct 2025 14:43:44 +0000
Message-Id: <DD8RMISG1KAO.3N7ANM9R2UEAN@wolber.net>
Subject: [TECH TOPIC] Crossing the Semantic Gap: Documenting Design Intent
From: "Chuck Wolber" <chuck@wolber.net>
To: <ksummit@lists.linux.dev>, <kstewart@linuxfoundation.org>,
 <gpaoloni@redhat.com>, <acarmina@redhat.com>
X-Mailer: aerc 0.21.0

Hi All,

This is a joint topic proposal from Chuck Wolber, Gabriele Paoloni, and Kat=
e
Stewart.

At LPC 2024 the session =E2=80=9CImproving kernel design documentation and =
involving
experts=E2=80=9D [1] discussed the need for enhancing and extending documen=
tation of
kernel code. Since then, we have made initial submissions to introduce code
specifications into the TRACING subsystem [2][3], and later proposed a
guideline with a worked example in /drivers/char/mem.c [4], accompanied by
selftests traceable to these specifications. These are not intended as comp=
lete
solutions, but as baselines around which automation can be built. Experts f=
rom
other domains can develop code specifications within the kernel that will
create maintainable coupling between code, specification, and test.

The motivation is that without code specifications, integrators (i.e. those
making use of the Linux kernel) must guess at expected behavior by reading
code; developers spend longer understanding existing behavior before writin=
g
patches; and testers risk interpreting bugs as features when writing tests.=
 All
of these increase maintainer burden, since only review can catch such
misalignments.

Framed another way: writing code inevitably creates a semantic gap between
developer intent and code. Crossing that gap in the forward direction (inte=
nt =E2=86=92
code) is straightforward, but reversing it (code =E2=86=92 intent) is lossy=
 and relies
heavily on subsystem familiarity. This is the current practice today, but i=
t
does not scale well, and it limits how tightly tests can be coupled to actu=
al
design intent.

Our proposal is to continue exploring a lightweight adaptation of aerospace=
 and
automotive design techniques, tailored to the Linux kernel development proc=
ess,
to explicitly couple developer intent to code and test. The expected benefi=
ts
are technical debt reduction, long-term retention of semantic clarity, test=
ing
that traces to actual design intent, and less time spent by maintainers
explaining nuanced behavior.

The goal of this discussion is to gather wider maintainer feedback on the v=
alue
of such specifications, and to chart possible next steps.


Best Regards,

Chuck Wolber
Gabriele Paoloni
Kate Stewart


[1] https://lpc.events/event/18/contributions/1894/
[2] https://lore.kernel.org/linux-trace-kernel/20250814122141.109076-1-gpao=
loni@redhat.com/
[3] https://lore.kernel.org/linux-trace-kernel/20250814122206.109096-1-gpao=
loni@redhat.com/
[4] https://lore.kernel.org/all/20250910170000.6475-1-gpaoloni@redhat.com/


