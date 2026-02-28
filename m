Return-Path: <ksummit+bounces-2853-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOpQKllio2myBQUAu9opvQ
	(envelope-from <ksummit+bounces-2853-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sat, 28 Feb 2026 22:47:05 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1806B1C93E4
	for <lists@lfdr.de>; Sat, 28 Feb 2026 22:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCF7D30F63A6
	for <lists@lfdr.de>; Sat, 28 Feb 2026 20:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78BB2C178D;
	Sat, 28 Feb 2026 20:29:09 +0000 (UTC)
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AEE2D0C79
	for <ksummit@lists.linux.dev>; Sat, 28 Feb 2026 20:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772310548; cv=none; b=gj8kpm6kFqpNychWhaYDLaZOCQGKFscvDE8sssG7zarXsAbv7BITd53V/KzrXuLiMwqvNwX3JXkjqYqJ++u2SuCr7LyWQp49V1RIJewr8xOv1cYDjGsjmlRrwQqVLWbNebQdX8PwFJwz54rOyPPI6t92x2xv4/Zq97Nt67IO1dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772310548; c=relaxed/simple;
	bh=8JUHWEwrqw7Ad64ezJBq3TlVWq3j/6xC1FY7kboL4fM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=V4RH3AtU1PPloXJbOWK9hGO4hXH8txad79lxItlrmxJ8ZWsj1cqQ12n4X5qdItumktG4znw5TrR/tOLJ12YedkHrRDuFBL7xXxfZwVuyRvqNCqWCvfAio7/kqEYmvwrhgruTR4pbsyT4R3PuIogA3Gi81Mz2MMngubbBXO7iyPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5C86B298599;
	Sat, 28 Feb 2026 21:29:00 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 27LjU9bXGMpJ; Sat, 28 Feb 2026 21:28:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3467229859D;
	Sat, 28 Feb 2026 21:28:58 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id KTB-z5IjOdRk; Sat, 28 Feb 2026 21:28:58 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id D5328298599;
	Sat, 28 Feb 2026 21:28:57 +0100 (CET)
Date: Sat, 28 Feb 2026 21:28:57 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, 
	Thorsten Leemhuis <linux@leemhuis.info>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	users <users@kernel.org>, ksummit <ksummit@lists.linux.dev>
Message-ID: <583136576.604.1772310537428.JavaMail.zimbra@nod.at>
In-Reply-To: <20260228152617.06b392de@fedora>
References: <20251209-roaring-hidden-alligator-068eea@lemur> <CAMuHMdWHRdsXahgxXMsSDFuuUwxzpvkT4oujg=tje2Rr5jr3SA@mail.gmail.com> <1655051015.2216.1772209338375.JavaMail.zimbra@nod.at> <5dea1bca-75fe-4e3c-950d-d489a438299a@leemhuis.info> <1786920159.1633.1772291851870.JavaMail.zimbra@nod.at> <CAHk-=wh3fsqZ=KUfm2cnq_D_U63Pk33Q7cs8_QYdyzbPXjE1bw@mail.gmail.com> <1661016163.157.1772303364121.JavaMail.zimbra@nod.at> <20260228152617.06b392de@fedora>
Subject: Re: slowly decommission bugzilla?
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF147 (Linux)/8.8.12_GA_3809)
Thread-Topic: slowly decommission bugzilla?
Thread-Index: FcokWeTQYEKaMYEq7X1d52bX0Aodxw==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2853-lists=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[nod.at];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[richard@nod.at,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[get_maintainers.pl:url,nod.at:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,goodmis.org:email]
X-Rspamd-Queue-Id: 1806B1C93E4
X-Rspamd-Action: no action

----- Urspr=C3=BCngliche Mail -----
> Von: "Steven Rostedt" <rostedt@goodmis.org>
>> *If* debuginfo and tooling is available to the user, of course they shou=
ld
>> include the decoded stack trace to the report.
>> How to do that should be included in the instructions on how to report
>> the issue by mail.
>=20
> What would be great is if a tool took the current crash, ran it through
> decode_stacktrace.pl, and then run the files it produces through
> get_maintainers.pl and then Cc a subset of people that are most likely
> to be able to figure it out.

Wouldn't that only work if the report is able to upload the kernel debug
info too?

Thanks,
//richard

