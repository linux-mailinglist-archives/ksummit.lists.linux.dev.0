Return-Path: <ksummit+bounces-2934-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id auoCBFUFPGrWiggAu9opvQ
	(envelope-from <ksummit+bounces-2934-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Wed, 24 Jun 2026 18:27:01 +0200
X-Original-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A57E6BFF64
	for <lists@lfdr.de>; Wed, 24 Jun 2026 18:27:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amazon.com header.s=amazoncorp2 header.b=IAapPjyT;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2934-lists=lfdr.de@lists.linux.dev" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="ksummit+bounces-2934-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=quarantine) header.from=amazon.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C58443033899
	for <lists@lfdr.de>; Wed, 24 Jun 2026 16:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DBB1C84A6;
	Wed, 24 Jun 2026 16:26:42 +0000 (UTC)
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8313C2EA173
	for <ksummit@lists.linux.dev>; Wed, 24 Jun 2026 16:26:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782318401; cv=none; b=jeQXxWNdHR+Bp2OGXNSuojSleVtfAGp8RQXRPqL5DzREHXr4tqjjTeNqy5SBhH6BUZ+iru0bjvfAoVr1r1Z05sM5LtKJlUDGko8Dea9dcIthCo2uSxSiwtyRqwf4ZcRybFcTw8WJq5hzKti9TaPoLomV+aQt7A8F5kad4QW1vVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782318401; c=relaxed/simple;
	bh=rmxaQhyXoZ4+zyBSJXpcojAadJtyrtNC9vROjqdx7P8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CrSY1pjzlHzMj4MR3FZ84MZowsU+M98j+o24zXiF+jX+kONgghQRUH2hjUnQ4xbKr5jHIdb+ktPF9xrMAI7fVwT8puVWqf/T9oIphQQa3gDFFoceZ82p9Rbd9U3K7l3TsununW4Mx0WQpA4Ng0Vb21QU1KTuKKXq1vnTgwEjd5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=IAapPjyT; arc=none smtp.client-ip=44.246.68.102
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1782318400; x=1813854400;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6x+Iy29ZXgVnFcuxhpSsRYb+pFuHfNkK5SI+9Bgjmpg=;
  b=IAapPjyTA1PI8+3rw5rsQUPAXts9ZiMPQI0R7OgsGThYlO1tN85FNf0t
   YYyocQyUZcfz4VDT+rvXwAqBZCeo9Ywdp66cCLIGXnIyths0KUvR8n9Gs
   LQNK/JZJGJ4UU7JIhmxDR6NVDl0Qcm3DP6tqy12esm3H3wH+UfAp9cAiA
   8ZBWDtKQ5s3sBVKAxP4DGbLmEmSWBi/TonJGAKWtyVXZX/mAoXkdnswg/
   KppiieWL8ZSYKVofqI9aICRkZcm9lJeM4Pbov/IJXW0lNM/WZ8nfp/BaR
   6mx+aBhrygSW833iYqbGP48hWXLNAO66a7yJqilPkStRZ17iVtyTmilho
   g==;
X-CSE-ConnectionGUID: NXTADpBDQliWhcaEOQ7UJg==
X-CSE-MsgGUID: hOCz0BPqRd2Cb0A8NFlaTA==
X-IronPort-AV: E=Sophos;i="6.24,222,1774310400"; 
   d="scan'208";a="22439305"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 16:26:40 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:19298]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.52.142:2525] with esmtp (Farcaster)
 id 0c231238-2533-42fd-ac96-b4523e8fcf53; Wed, 24 Jun 2026 16:26:39 +0000 (UTC)
X-Farcaster-Flow-ID: 0c231238-2533-42fd-ac96-b4523e8fcf53
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Wed, 24 Jun 2026 16:26:39 +0000
Received: from dev-dsk-gunnarku-2c-36117f29.us-west-2.amazon.com
 (172.23.139.22) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43; Wed, 24 Jun 2026
 16:26:39 +0000
From: Gunnar Kudrjavets <gunnarku@amazon.com>
To: <ksummit@lists.linux.dev>
CC: <dgj@amazon.com>, <jbouron@amazon.com>, <zielman@amazon.com>
Subject: [TECH TOPIC] Kernel CVE Triage at AWS Scale: Two Years of Empirical Findings
Date: Wed, 24 Jun 2026 16:25:42 +0000
Message-ID: <20260624162626.25384-1-gunnarku@amazon.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D032UWA004.ant.amazon.com (10.13.139.56) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.66 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[gunnarku@amazon.com,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2934-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A57E6BFF64

Hi all,

We would like to propose the following tech topic for discussion at
LPC 2026.

Since the Linux kernel project became a CVE Numbering Authority (CNA)
in February 2024, organizations maintaining custom kernels have faced
a flood of CVE disclosures. We present empirical findings, lessons
learned, and the key challenges that the kernel team responsible for
Amazon Web Services fleet infrastructure encountered over the following
two years while handling the steady flow of kernel CVEs.

We summarize our approach to assessing kernel CVEs in a warehouse-scale
environment, pruning our code base to reduce the attack surface, along
with quantitative results from field data.

Specifically, we examine:

  a) how NVD/CVSS scores and third-party assessments correlate with
     our final in-house ratings;

  b) how community guidance, including stable tree tracking and
     domain-specific risk assessment, measurably improved our
     development velocity, kernel maintenance, and kernel adoption
     strategy; and

  c) how backporting practices introduce regressions and compound
     risk.

We conclude with data on patching velocity and CVE-related trends
across LTS versions. Although our data comes from a single environment,
we believe these findings generalize to any organization that maintains
in-house or custom kernels.

We will close with an open discussion on emerging developments
(including where AI-assisted tooling fits into the CVE triage and
patching pipeline) and invite attendees to challenge, extend, or
contradict our findings with their own data.

Thanks,
Gunnar

