Return-Path: <ksummit+bounces-2886-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOP9HQSvqmmLVQEAu9opvQ
	(envelope-from <ksummit+bounces-2886-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 06 Mar 2026 11:40:04 +0100
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD6821EF94
	for <lists@lfdr.de>; Fri, 06 Mar 2026 11:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A733306341F
	for <lists@lfdr.de>; Fri,  6 Mar 2026 10:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6817A37C90F;
	Fri,  6 Mar 2026 10:37:50 +0000 (UTC)
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3033D30FC30
	for <ksummit@lists.linux.dev>; Fri,  6 Mar 2026 10:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793470; cv=none; b=mwF0hZAxy+y9EeGhfrqwbz6z7DlInfg2UV9cb2i2KOgacFBwtmwyBqb3ygA/Fiw81RTh3QMwlKzld5m62cGjjkNl+RwkffAqdlPvWSx3691XU0fZ6fFysQS0/ZkQYJmW1vIOYw8X4QTsY6nPjYJlDwa28SHQaVIBWokI4B2sedQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793470; c=relaxed/simple;
	bh=D11+NuwHlPW0cTE5AO6+2ngh4PXDxbvcEyVcn1xlPw4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=mDquIRpr/2HOgPAuBLgViXR6931N1IBr/5SU7I3WTNQkkOi2wRRdX9wyIRF0p5KKuRCafyTPU0Y45R7DdN/w6DPpuVxGmpCietPpRWkJ/nGYhkxX4GsYKLAA2RY9/5uyFMN2LlaQR5cG1cDKFFKST5KmeCUALK1JFmqSVJS4PNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 958892A87F7;
	Fri,  6 Mar 2026 11:37:38 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id w9QC-RwIAl4I; Fri,  6 Mar 2026 11:37:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B02202A8813;
	Fri,  6 Mar 2026 11:37:37 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 5rLRrvnTsrOc; Fri,  6 Mar 2026 11:37:37 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5CC172A87F7;
	Fri,  6 Mar 2026 11:37:37 +0100 (CET)
Date: Fri, 6 Mar 2026 11:37:36 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Steven Rostedt <rostedt@goodmis.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	users <users@kernel.org>, ksummit <ksummit@lists.linux.dev>
Message-ID: <1617579485.3599.1772793456949.JavaMail.zimbra@nod.at>
In-Reply-To: <1786920159.1633.1772291851870.JavaMail.zimbra@nod.at>
References: <20251209-roaring-hidden-alligator-068eea@lemur> <20260226090425.11bb585062783c0e1fcf0b32@linux-foundation.org> <20260227101631.67756268@gandalf.local.home> <677258882.1999.1772206555300.JavaMail.zimbra@nod.at> <CAMuHMdWHRdsXahgxXMsSDFuuUwxzpvkT4oujg=tje2Rr5jr3SA@mail.gmail.com> <1655051015.2216.1772209338375.JavaMail.zimbra@nod.at> <5dea1bca-75fe-4e3c-950d-d489a438299a@leemhuis.info> <1786920159.1633.1772291851870.JavaMail.zimbra@nod.at>
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
Thread-Index: eoo0beoEVns3jwFwFZGpc3+4n9VRgX5QH36L
X-Rspamd-Queue-Id: 1DD6821EF94
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DMARC_NA(0.00)[nod.at];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[richard@nod.at,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-2886-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

----- Urspr=C3=BCngliche Mail -----
> Von: "richard" <richard@nod.at>
>> This, on the other hand, would help quite a few people.
>>=20
>> Also, broad categories with optional, more fine-graded subcategories
>> would be nice for some areas. Like mm, which has 18 entries in
>> MAINTAINERS that start with "MEMORY MANAGEMENT - ", which confuses
>> people that do not know "if in doubt, just use the entry for MEMORY
>> MANAGEMENT"
>>=20
>>> heck even a stack trace or a BUG/WARN_ON/Oops
>>=20
>> This even more (but of course this is harder)

While traveling, I found some spare time to prototype my idea:

https://git.infradead.org/~rw/kcontact/

The basic idea is that users (not kernel developers) can paste their
kernel logs (warning, oops, panic, ...) into the site, and the site
gives them guidance on where to report the issue.
If you like the idea, I'll happily extend it with further instructions
on how to report and improve stack traces, etc.

The website (JavaScript-based and static) analyzes kernel logs and
looks for stack traces. For each found kernel symbol, it consults a pre-com=
puted
lookup table to find the matching subsystem contact.
So far, it only uses the "L:" entries.

To avoid churn, it ignores the first 3 entries of each stack trace because
these are usually just entry code.

Currently, the lookup table is constructed from an x86_64 allmodconfig buil=
d.
Having a combined table with other architectures is possible too.

Thanks,
//richard

