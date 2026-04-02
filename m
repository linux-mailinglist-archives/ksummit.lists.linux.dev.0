Return-Path: <ksummit+bounces-2898-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDIfEIbvzWkzjQYAu9opvQ
	(envelope-from <ksummit+bounces-2898-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 02 Apr 2026 06:24:38 +0200
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF653838C0
	for <lists@lfdr.de>; Thu, 02 Apr 2026 06:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E9E430A04E6
	for <lists@lfdr.de>; Thu,  2 Apr 2026 04:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF74361667;
	Thu,  2 Apr 2026 04:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="an4hL3cm"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DCB36073E
	for <ksummit@lists.linux.dev>; Thu,  2 Apr 2026 04:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775103349; cv=none; b=jPzu8+liO/ZcGSq9+Mo/zdRnTx2ahZ60Y2GfX6ydzvhjzQUY6Rqaxr40UdFmu4OV34/PRx94jtMcSb0qU7vdScQ/AP/LXHYQnOGPeCueZptbO491k42JHN4CxKXWt9xS4uWzNIdjUZVNcEDD5E4tA8ftcGTvYiJOf+AUgxEs4ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775103349; c=relaxed/simple;
	bh=cWifz5TRByEHyCWYqAwswNdsEakDMxLG+K29NzNeZRs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VD0vfs6y6MZHTdvy8+gC3O7PSRZl77pRrIjOyNiV+o2e4Y42MjQS6xczMAPJmKEXcw0By/KyRFMmDI2gluQf4nfY2gfk98aksrum4jcn6w7+/TADsgql6BMKQIEtohn/oCl/SZ68SxHA1J/mGMI1qiaqsB8WFdKsd/SNuN+SRhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=an4hL3cm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6295EC19423;
	Thu,  2 Apr 2026 04:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775103348;
	bh=cWifz5TRByEHyCWYqAwswNdsEakDMxLG+K29NzNeZRs=;
	h=Date:From:To:Subject:From;
	b=an4hL3cmX5OqLlzxt3/Vo+UYzjpgzcaqcipKmBS43Nn3zLwduZdyreU0zUREJOBUa
	 fN+Q7osoDLSlDV5TfQY6RpwdmGuw+r6ho42a/hrVBxXJShcgptsmRGLL2FofDaux8h
	 Bc1fvJlFJXvATebWDt+FpeAbWeXV+04WV51DPB62pWYNia4iHeDm6nppeEdnKb+5rV
	 pB3OFxJunP2/zAzNcjVE17YXjGApN0hOzg3g3/aoYWnbDwvzyWtoB2eBhkFovSNcy/
	 lxg2veGj5ptxva73St0xwj7wxgN/DcFbfz3kE00ZXTZVCa/Vpi3DwTH58uvh5vymba
	 wEaDKp3DkFtWw==
Date: Thu, 2 Apr 2026 00:15:47 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: ksummit@lists.linux.dev
Subject: [TECH TOPIC] new maintainer-oriented features of b4
Message-ID: <20260402-singing-silver-swine-c7e31b@lemur>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2898-lists=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mricon@kernel.org,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.957];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BDF653838C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello, all:

I would like to propose a tech topic for the upcoming kernel summit.

B4 is already a well-known tool for retrieving and applying series from
lore.kernel.org. Recently, it gained several new features that can make the
life of a maintainer a bit easier:

- b4 review - helps with code review and full series lifecycle management
- b4 bugs - integrates distributed bug tracking into your workflow

This session will go over the new features and how they can assist overloaded
maintainers in keeping a handle on the stream of incoming changes and bug
reports while retaining decentralized nature of Linux kernel development.

Best regards,
-- 
KR

