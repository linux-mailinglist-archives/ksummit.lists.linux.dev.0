Return-Path: <ksummit+bounces-2893-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNXPMGDJtmn6IgEAu9opvQ
	(envelope-from <ksummit+bounces-2893-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sun, 15 Mar 2026 15:59:44 +0100
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEB22911AD
	for <lists@lfdr.de>; Sun, 15 Mar 2026 15:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D71A300AC0A
	for <lists@lfdr.de>; Sun, 15 Mar 2026 14:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642BB36F41D;
	Sun, 15 Mar 2026 14:59:04 +0000 (UTC)
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D6F36F41E
	for <ksummit@lists.linux.dev>; Sun, 15 Mar 2026 14:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773586744; cv=none; b=HPzKgEM+PgADj41OlQyFHoHatl1dPfM6sdOqwGdSTamqK8MtezA6Ur3gHy9xQkQKZO565V1HK2p8GTWqU2xHEccqOVqzKH1UV8PHKadZAL0UDoeSL7jJxpbpf73CkZZ08OPgXcwOmGGRLcIMg6fvRMehWw/oMdj6svgGm+4uHII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773586744; c=relaxed/simple;
	bh=F8Dgo/eKAI3yH1OJeYlSRrOkl/unjpu2fzt/myBnmfc=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Qb3qVv9rBUBO0OY1I7R5vm9VF4DuSTWGqMYC2iWHt17K+hwuSobfow9sybXKIQFIcKVY2YPP4V/v4DzJRXZSeBO1e+rBbbc+cyCMU/zp7sIYcozlzdx4ozFKoWLwSdhC7jdRrqlgGw896oTwoiqOnTlLYdtY5dJSvPjnQLSHJ+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 10FDC298580;
	Sun, 15 Mar 2026 15:58:53 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id NGyWR5H419SM; Sun, 15 Mar 2026 15:58:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id EA4BD29859D;
	Sun, 15 Mar 2026 15:58:51 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ogwiu5LuR9Oa; Sun, 15 Mar 2026 15:58:51 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id BA512298580;
	Sun, 15 Mar 2026 15:58:51 +0100 (CET)
Date: Sun, 15 Mar 2026 15:58:51 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, 
	Steven Rostedt <rostedt@goodmis.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	users <users@kernel.org>, ksummit <ksummit@lists.linux.dev>
Message-ID: <571171361.40507.1773586731470.JavaMail.zimbra@nod.at>
In-Reply-To: <CAMuHMdVUoDsZeewXFevLR4kw6iWXwrGRzdZ+N5BFzzLUuLu1Ww@mail.gmail.com>
References: <20251209-roaring-hidden-alligator-068eea@lemur> <677258882.1999.1772206555300.JavaMail.zimbra@nod.at> <CAMuHMdWHRdsXahgxXMsSDFuuUwxzpvkT4oujg=tje2Rr5jr3SA@mail.gmail.com> <1655051015.2216.1772209338375.JavaMail.zimbra@nod.at> <5dea1bca-75fe-4e3c-950d-d489a438299a@leemhuis.info> <1786920159.1633.1772291851870.JavaMail.zimbra@nod.at> <1617579485.3599.1772793456949.JavaMail.zimbra@nod.at> <CAMuHMdVUoDsZeewXFevLR4kw6iWXwrGRzdZ+N5BFzzLUuLu1Ww@mail.gmail.com>
Subject: Re: slowly decommission bugzilla?
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF148 (Linux)/8.8.12_GA_3809)
Thread-Topic: slowly decommission bugzilla?
Thread-Index: 1OPtHQdTyDA/1Q+330v4+ld8Hbpp/Q==
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_FROM(0.00)[bounces-2893-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[nod.at];
	RCVD_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[richard@nod.at,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.541];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,infradead.org:url,linux-m68k.org:email,nod.at:mid]
X-Rspamd-Queue-Id: 3AEB22911AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

----- Urspr=C3=BCngliche Mail -----
> Von: "Geert Uytterhoeven" <geert@linux-m68k.org>
>> While traveling, I found some spare time to prototype my idea:
>>
>> https://git.infradead.org/~rw/kcontact/
>=20
> [...]
>=20
>> Currently, the lookup table is constructed from an x86_64 allmodconfig b=
uild.
>> Having a combined table with other architectures is possible too.
>=20
> Nice! I threw a few arm/arm64 crash logs I had lying around at it,
> and the results looked good enough to be usable!

Due to bad weather here in Austria I found more time.
I polished the web page added some notes on reporting bugs and
published the source code of the tool which generated the JSON "database".

https://github.com/sigma-star/kbooboo/tree/master/datagen

I'm not sure how to progress.
Is this something we want on kernel.org?
Hosting is easy, all it needs is a static web server.

I also consider buying a domain for the tool. At least from the feedback
I got on- and offline I plan to worth further on it.

Thanks,
//richard

