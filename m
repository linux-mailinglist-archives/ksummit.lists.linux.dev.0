Return-Path: <ksummit+bounces-1211-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF508584F6
	for <lists@lfdr.de>; Fri, 16 Feb 2024 19:16:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 680EA1C21044
	for <lists@lfdr.de>; Fri, 16 Feb 2024 18:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75F8134CCE;
	Fri, 16 Feb 2024 18:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VlIFarBw"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321C4131E22
	for <ksummit@lists.linux.dev>; Fri, 16 Feb 2024 18:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708107374; cv=none; b=odF0QdXFV/KYQsj96Vquhqa5pGppovIxsDz7Jy9Ni5KRjWL/flwxxwNomAXrnVaEHQ5acov2WFDh3lCZOFVO/tA19d5PR/qfYf3PPCofb72PrYOsORRHOUIVL24r4/uUqj0omeUT2OLs7FCJP2Ijo2achGBEwq9p8E7fJvPlAqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708107374; c=relaxed/simple;
	bh=X0fY5PxF6D1/iahcC/3ui/zwMTzXhgN75zUSte9J2v8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jlbBpWiquVup4fnxXbyN57fZ3hlU+C+TD+4CPvVKtIBaRgPGSxPwPndTmGDUR5gx4aqrDHsL1QrufyzJL06FbhEU59YXhbNA+URl3h82fmAvWx9swisjIuHmEajdblvJCuHAl6f8r3KijXed1ffImH/EC/6HBzEqtMZMR6VrLiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VlIFarBw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599E7C433F1;
	Fri, 16 Feb 2024 18:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708107373;
	bh=X0fY5PxF6D1/iahcC/3ui/zwMTzXhgN75zUSte9J2v8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VlIFarBw6ZPdMHv2qToHqVEc+n/ckh4gHGVufD5kO9Tfr5f9FgpaRPB/neig3UXYf
	 RkF3npKvFgN2hktACwzZE1sVqwJFXXJV7AarRdnRwwFfqSMbqv0z5mokNLkSwHEvjM
	 Mu76LDhV6HLtFL5pJJANfKGcf0C/ZVENue1KgeaXXIxKVpJnYFNAZ+V+BuE3BTfwgN
	 By8g/acQcPGAx+P2KJ8nU34P4L5zndaa6M+4ppg/UpBBLLffiB2GZ+NSv/arSPN5SY
	 56kRYoxLmx3Xkd173Ni5mP7xG9BqlBXO5F6KzI2934VGigiTozX2f1UK29cIF0ldfm
	 bRG6sm4u9XK7A==
Date: Fri, 16 Feb 2024 19:16:14 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-15?Q?Michal_Such=E1nek?= <msuchanek@suse.de>
cc: Greg KH <gregkh@linuxfoundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
    Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues --
 security@korg vs. linux-distros@
In-Reply-To: <20240216181307.GW9696@kitsune.suse.cz>
Message-ID: <nycvar.YFH.7.76.2402161915130.21798@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm> <658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com> <2023081515-lake-spotty-6a3a@gregkh> <20230815084253.7091083e@gandalf.local.home> <2023081540-vindicate-caterer-33c6@gregkh>
 <nycvar.YFH.7.76.2308160005300.14207@cbobk.fhfr.pm> <20230815183120.0c92a759@gandalf.local.home> <2023081641-unstitch-kangaroo-a2c1@gregkh> <20240216171427.GA9244@kitsune.suse.cz> <2024021634-starlit-waviness-c329@gregkh>
 <20240216181307.GW9696@kitsune.suse.cz>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 16 Feb 2024, Michal Such=E1nek wrote:

> > That was a very old thread, why dig it up now?
>=20
> It was linked to recently and I did not realize how old it is.

Yeah, I take the "blame" for that. I referenced that thread on our=20
internal IRC in order to point out another case where the role of=20
(commercial) distros was downplayed.

--=20
Jiri Kosina
SUSE Labs


