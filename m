Return-Path: <ksummit+bounces-2906-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IUSBdV8zmnBnwYAu9opvQ
	(envelope-from <ksummit+bounces-2906-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 02 Apr 2026 16:27:33 +0200
X-Original-To: lists@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A00738A7F2
	for <lists@lfdr.de>; Thu, 02 Apr 2026 16:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C1E22303CBD2
	for <lists@lfdr.de>; Thu,  2 Apr 2026 14:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC673ECBE7;
	Thu,  2 Apr 2026 14:21:37 +0000 (UTC)
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20F83E9592
	for <ksummit@lists.linux.dev>; Thu,  2 Apr 2026 14:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775139696; cv=none; b=RHICS+UeOkeasHcWqcr50GbaPCp53CgaJB12544MdamrD0OTTwS80jqVea7PeHymTHxE13WOCPpB74hORmMk+EmKVOq+hJHD3ldLAeNvo55cY2vx4D0AEBy5+IT3Mhlcrj/dAQ2LROp4AFOe8ySJSUEIq2iqTyGMVfFuLePLago=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775139696; c=relaxed/simple;
	bh=9UOBeA/Q19J7q0wcZVVYYnohmeUPhfIk+Gj1E3XGMZ8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=XedVZkIYslnu1HmmvtXOjCwANQ5m8HPurJaLvmz6qQ9cEz4Q6HJTdvT/Ck/uo0Jl+dfmtuGWoYNKjKqn+AlSpXd185SlQarFT/r9wkypkeDh3/0OaU+bkeTjNtfZstzSnguq0LlsWsePyTAQwkhZeuDF7S4G/odhMkFIlKSJG2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id F08DE9CF15;
	Thu,  2 Apr 2026 16:15:28 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id ON5YS_E9FIYu; Thu,  2 Apr 2026 16:15:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 61A468A9A2;
	Thu,  2 Apr 2026 16:15:28 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 8cVgyeaRoQyk; Thu,  2 Apr 2026 16:15:28 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1BD529CF3F;
	Thu,  2 Apr 2026 16:15:28 +0200 (CEST)
Date: Thu, 2 Apr 2026 16:15:27 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, users <users@kernel.org>, 
	ksummit <ksummit@lists.linux.dev>
Message-ID: <526321495.383203.1775139327804.JavaMail.zimbra@nod.at>
In-Reply-To: <20260402-civet-of-legal-infinity-76fdd2@lemur>
References: <20251209-roaring-hidden-alligator-068eea@lemur> <b93eae05-5e40-42f0-8256-d46d411008a4@leemhuis.info> <20260402-expert-maroon-partridge-f77f94@lemur> <ef874caf-5345-4c0d-8855-1338b5177d8b@leemhuis.info> <20260402-civet-of-legal-infinity-76fdd2@lemur>
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
Thread-Index: 5PXLdVwAlMK3PKqUvQlHjuZoy40Q+w==
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-2906-lists=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[nod.at];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[richard@nod.at,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.753];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linuxfoundation.org:email,nod.at:mid]
X-Rspamd-Queue-Id: 0A00738A7F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

----- Urspr=C3=BCngliche Mail -----
> Von: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
>> Just wondering: what Richard posted in this thread (would you be willing
>> to host that?), or do you have something else in mind?
>=20
> We can figure something out -- it's hard to figure out if we can host
> something if we don't know full architectural details. In theory, kernel.=
org
> is bound by some legalese in its nonprofit charter document that prevents=
 us
> from broadening our scope of services too far, but since we're already ru=
nning
> bugzilla, we should be fine to add other bug-reporting tools.

Looks like I did a bad job in explaining how it works.

So, the web frontend[0] is fully static. Just HTML and JavaScript, all the =
magic happens
client side.
Any webserver will do it.

The frontend operates on a JSON "database" which needs to be generated.
The current generator[1] is written on go and runs on Linux.

Every once on a while the JSON database should be generated from a more or =
less
recent Linux build.
e.g. once every time Linus releases a new version.
All you need is a kernel build and the tool.
The steps are documented here [2].

Of course I'm willing to adopt the web frontend to match kernel.org standar=
ds.

Thanks,
//richard

[0] https://github.com/sigma-star/kbooboo/tree/master/frontend
[1] https://github.com/sigma-star/kbooboo/tree/master/datagen
[2] https://github.com/sigma-star/kbooboo/tree/master?tab=3Dreadme-ov-file#=
creating-the-lookup-table-datajsongz

