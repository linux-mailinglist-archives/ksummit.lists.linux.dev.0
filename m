Return-Path: <ksummit+bounces-2965-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fhmSKNe3VWrGrwAAu9opvQ
	(envelope-from <ksummit+bounces-2965-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 14 Jul 2026 06:15:19 +0200
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A5E750C63
	for <lists@lfdr.de>; Tue, 14 Jul 2026 06:15:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mit.edu header.s=outgoing header.b=iIQ6xewQ;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2965-lists=lfdr.de@lists.linux.dev" designates 172.234.253.10 as permitted sender) smtp.mailfrom="ksummit+bounces-2965-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=none) header.from=mit.edu;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BE1B3037686
	for <lists@lfdr.de>; Tue, 14 Jul 2026 04:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B9936A033;
	Tue, 14 Jul 2026 04:15:16 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CDD3D3304
	for <ksummit@lists.linux.dev>; Tue, 14 Jul 2026 04:15:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784002509; cv=none; b=h06WHa0qESgFBUJ8gqAdPuH9UumjNdDCmyB6ktSmTus+uIFihU0lvkramCyWbaMsc8Z1au44JV66R/coP2AaiD1bOCF6KA07h+v3tW/1eIQxupzln+mMTFuPejao0w3GQSdQy2PRUs/LJFN6cCTYPs5eP58w45NEnzZ6paIm5ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784002509; c=relaxed/simple;
	bh=vJrxMfVwbCIAJH/l2/d4/earlMFVUXka6g/p9DJdDXw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bo9cnTmMUCAazBMDO5Nz/uCkqAEKZh1vgF9JP9isGgqYzE5GhRVz2NFXxgdEfRB2FJ74lWDbOqRQDe2ec+mITpBf6wxs3WCtaOCa22TM509nljA5897F2jN7tvpTo/2qEnMaXbClFXSO8OPQptABq/q96uFVC4f9a6e/wMEut9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=iIQ6xewQ; arc=none smtp.client-ip=18.9.28.11
Received: from macsyma.thunk.org ([151.240.45.25])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 66E4ErRC025390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 00:14:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1784002496; bh=MV2PppsIiMWqIO+DNMAc6xCQwmADIksnc8DCtHjHJMI=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=iIQ6xewQv08RpAocToswgcb8vVJMxz9k1bD7fceVk+A763UEO24mt1+/b4GT46IUP
	 NjyJieu6TJDOGhozlV65RysZm4E3muBfUP+LbD195TGkwOfl7L8+0jRUOBOouRE5U9
	 65+kNDdOgNQt6azYCU3QJwFW1IP0hig6PB4toXyhgVLpuKTTA6hVYVmB+UL7f1KwdN
	 1vAPffzNJ2Zo4MNONM3va4Pn8ZoMipvUYJrHNF9LIPi6H54YfxiZnmFZEwrKEYI+/s
	 QRoPyEdQkxJ4neHEVUTgyE87/s+E4L1Wxzh51941RJYYZSZzPNaylQiRwy+N3lYpzr
	 SMgrWzkHYZEMw==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id C5547A04BAB; Tue, 14 Jul 2026 00:14:53 -0400 (EDT)
Date: Tue, 14 Jul 2026 00:14:53 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-mm@kvack.org, ksummit@lists.linux.dev
Subject: Maintainers Summit 2026 Call for Topics
Message-ID: <alW3eJ9x6iJ8Juhi@mit.edu>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mit.edu,none];
	R_DKIM_ALLOW(-0.20)[mit.edu:s=outgoing];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mit.edu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2965-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tytso@mit.edu,ksummit@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lists.linux.dev:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4A5E750C63

This year, the Maintainers Summit will be held in Prague, Czech
Republic on Thursday, October 8th, 2026, just after the Linux
Plumber's Conference (October 5 -- 7th).

As in previous years, the Maintainers Summit is invite-only, where the
primary focus will be process issues around Linux Kernel Development.
It will be limited to 30 invitees and a handful of sponsored
attendees.

The Maintainers Summit depends on the development community to bring
forward topics that can benefit from discussion in that setting.  What
are the nagging development issues, pain points, or other important
decisions that are not amenable to resolution on the mailing lists?
If you have a topic in mind, please send it to ksummit@lists.linux.dev
with a subject prefix of [MAINTAINERS SUMMIT].

The attendees are jointly selected by Linus Torvlads (who has provided
us with a roughly a dozen maintainers that he would like to attend),
and the program committee, who choose from maintainers and developers
who have been the most active in the past year.

Anybody proposing a topic before July 24th will be added to the list
of potential attendees selected by the program committee; other
potential nominees can be proposed (as a self-nomination or by others)
by sending a note to the ksumimt list saying why that person's
presence would help the discussion.

For an examples of past Maintainers Summit topics, please see the
these LWN articles:

 * 2025 https://lwn.net/Articles/1049982/
 * 2024 https://lwn.net/Articles/990740/
 * 2023 https://lwn.net/Articles/951847/

The program committee this year is composed of the following people:

Christian Brauner
Jon Corbet
Greg KH
Ted Ts'o
Rafael J. Wysocki


