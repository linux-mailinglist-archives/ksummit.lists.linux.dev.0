Return-Path: <ksummit+bounces-2895-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHBcG618uGmVewEAu9opvQ
	(envelope-from <ksummit+bounces-2895-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Mon, 16 Mar 2026 22:57:01 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8EB2A1326
	for <lists@lfdr.de>; Mon, 16 Mar 2026 22:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FCA43032F65
	for <lists@lfdr.de>; Mon, 16 Mar 2026 21:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9659C36A014;
	Mon, 16 Mar 2026 21:56:57 +0000 (UTC)
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BD933CEA5
	for <ksummit@lists.linux.dev>; Mon, 16 Mar 2026 21:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773698217; cv=none; b=pCz2TpnqQlZSInoZS+HWb5zBbF6sF2CSqE2YVWyY3ABt6sW6zcFPL4bfqvjRzY2Dv4e0dPje0mxUblz/pjbvbymm2ms9Hu+3kAE0CTtNiqP0d1vn4pVVRarZWf0FkRFSrz0wauGyE95fmL1C/ZS3E4hMouz3/sapQepFe2qqDao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773698217; c=relaxed/simple;
	bh=s9oS5qVjqR5+z0NnuDTUFws+bBfyRxyyv6TaIHzhEfc=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=phVHxGzBTSVY/s3jA4J2775YqbFguCKd8a0JYBjvcJgeM3bhPfg8wL6vDwFVrBOO+zL/XIeEMYhQhmZX3ZbxxNn5+wxHXNOPPk86b05VSVVhXOWbHD8sgYXj2BY+3a7RC2BNJTd32ubdefhFJ21309aBpnfrodik2wF3XDKoNG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 434382C14A6;
	Mon, 16 Mar 2026 22:56:54 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id QzKpxKy84CT2; Mon, 16 Mar 2026 22:56:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 7A2222C14A8;
	Mon, 16 Mar 2026 22:56:53 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jRhg9Oo-B9RU; Mon, 16 Mar 2026 22:56:53 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4B5432C14A6;
	Mon, 16 Mar 2026 22:56:53 +0100 (CET)
Date: Mon, 16 Mar 2026 22:56:53 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Thorsten Leemhuis <linux@leemhuis.info>, 
	Steven Rostedt <rostedt@goodmis.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	users <users@kernel.org>, ksummit <ksummit@lists.linux.dev>
Message-ID: <1440843008.46131.1773698213099.JavaMail.zimbra@nod.at>
In-Reply-To: <2026031615-amusement-yam-d036@gregkh>
References: <20251209-roaring-hidden-alligator-068eea@lemur> <1655051015.2216.1772209338375.JavaMail.zimbra@nod.at> <5dea1bca-75fe-4e3c-950d-d489a438299a@leemhuis.info> <1786920159.1633.1772291851870.JavaMail.zimbra@nod.at> <1617579485.3599.1772793456949.JavaMail.zimbra@nod.at> <CAMuHMdVUoDsZeewXFevLR4kw6iWXwrGRzdZ+N5BFzzLUuLu1Ww@mail.gmail.com> <571171361.40507.1773586731470.JavaMail.zimbra@nod.at> <2026031615-amusement-yam-d036@gregkh>
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
Thread-Index: EPhkEsGjVFnNAML1qZ1jJuAPWfK5Xg==
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.889];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DMARC_NA(0.00)[nod.at];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[richard@nod.at,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-2895-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BF8EB2A1326
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

----- Urspr=C3=BCngliche Mail -----
> Von: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
> An: "richard" <richard@nod.at>
>> > Nice! I threw a few arm/arm64 crash logs I had lying around at it,
>> > and the results looked good enough to be usable!
>>=20
>> Due to bad weather here in Austria I found more time.
>> I polished the web page added some notes on reporting bugs and
>> published the source code of the tool which generated the JSON "database=
".
>>=20
>> https://github.com/sigma-star/kbooboo/tree/master/datagen
>>=20
>> I'm not sure how to progress.
>> Is this something we want on kernel.org?
>> Hosting is easy, all it needs is a static web server.
>=20
> Why not have kernelci host it?

Do you mean the data generation tool or the frontend?
For the data generation tool kernelci makes a lot of sense,
they should have enough versatile kernel builds to compute data file.

For the frontend I don't care much. It should be some location potential
bug reporters can find.

Thanks,
//richard

