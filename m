Return-Path: <ksummit+bounces-2842-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBbiE+K9oWnCwAQAu9opvQ
	(envelope-from <ksummit+bounces-2842-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 27 Feb 2026 16:53:06 +0100
X-Original-To: lists@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4CB1BA55E
	for <lists@lfdr.de>; Fri, 27 Feb 2026 16:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1DCFB30D0F09
	for <lists@lfdr.de>; Fri, 27 Feb 2026 15:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A7943DA43;
	Fri, 27 Feb 2026 15:36:02 +0000 (UTC)
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F06A43D50C
	for <ksummit@lists.linux.dev>; Fri, 27 Feb 2026 15:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206562; cv=none; b=dtY45Wu/VN+EdrxD4a8juDXe5r+hJCO2Ul9eQ331FDwS0ruSkUBjo7Gu6F1saOm6rkmL9zHFJCcTXvJIMi17TUachLtjkyoCCtbsX23mH2dUTWN5IPVwBaiad+UNbJzKK1YcSooux/lB+CNVrErKenCVwpzEtnC7yvVfJxa1QRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206562; c=relaxed/simple;
	bh=U4pXdTOpdB1sO10xvFxz67p240gPxLCm2d4lzSdJxlg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=XLRdhIdttXwG5HQXf1xXEtS/hzIgcrjwdphfpw09hvo4UWjOUNiGC0HG3S/258fJXw4SJNUuimmzXgb2yNY+dCW5OYrF35nAkiJpT+edtsNobWi/v5ecsj7fVxi/fKnNpxN3i0LxlISMXfY67vc08KQQXOKsJZ+Z/Bl3WbbPpGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id AC193298599;
	Fri, 27 Feb 2026 16:35:56 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id dQGRkIY-y3TB; Fri, 27 Feb 2026 16:35:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E14D929859D;
	Fri, 27 Feb 2026 16:35:55 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id E6eljODaYosr; Fri, 27 Feb 2026 16:35:55 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id B17F6298599;
	Fri, 27 Feb 2026 16:35:55 +0100 (CET)
Date: Fri, 27 Feb 2026 16:35:55 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Thorsten Leemhuis <linux@leemhuis.info>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	users <users@kernel.org>, ksummit <ksummit@lists.linux.dev>
Message-ID: <677258882.1999.1772206555300.JavaMail.zimbra@nod.at>
In-Reply-To: <20260227101631.67756268@gandalf.local.home>
References: <20251209-roaring-hidden-alligator-068eea@lemur> <b93eae05-5e40-42f0-8256-d46d411008a4@leemhuis.info> <20260226090425.11bb585062783c0e1fcf0b32@linux-foundation.org> <20260227101631.67756268@gandalf.local.home>
Subject: Re: slowly decommission bugzilla? (was: Re: kernel.org tooling
 update)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF147 (Linux)/8.8.12_GA_3809)
Thread-Topic: slowly decommission bugzilla? (was: Re: kernel.org tooling update)
Thread-Index: mzZhyKGKEMeeEOcVDbWfScedFnLeBg==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2842-lists=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[nod.at];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,get_maintainers.pl:url,goodmis.org:email,nod.at:mid];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[richard@nod.at,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 5A4CB1BA55E
X-Rspamd-Action: no action

----- Urspr=C3=BCngliche Mail -----
> Von: "Steven Rostedt" <rostedt@goodmis.org>
>> Or heck, add a front-end to get_maintainer right here in this web page.
>> People paste in a pathname and it spits back a bunch of email
>> addresses.
>=20
> This actually sounds like a good idea. Someone just told me that they fou=
nd
> a bug in a driver and I asked them if they notified upstream about it. Th=
ey
> said no, because they didn't know how.
>=20
> I just told them to randomly modify the file, do a git diff and redirect =
it
> into another file (making a random patch), and run get_maintainers.pl on
> it. That's a big hack and having a better interface to point others too
> would be useful.

I'm pretty sure someone can vibe code us a neat webinterface which queries
get_maintainers.pl in the background.

Thanks,
//richard

