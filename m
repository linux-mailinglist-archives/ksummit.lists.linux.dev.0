Return-Path: <ksummit+bounces-2151-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EDFB2B077
	for <lists@lfdr.de>; Mon, 18 Aug 2025 20:33:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71B68565870
	for <lists@lfdr.de>; Mon, 18 Aug 2025 18:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4FF9272E6F;
	Mon, 18 Aug 2025 18:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="dLYDnEEQ"
Received: from lamorak.hansenpartnership.com (lamorak.hansenpartnership.com [198.37.111.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A24211A11
	for <ksummit@lists.linux.dev>; Mon, 18 Aug 2025 18:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.37.111.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755541954; cv=none; b=mgUsmr+JNH1MZqaG0m4mvXQKJ1qGbr89kzrirnTnQNR5XFIafXZADdoxn0KlHXrooaSrwKdtEL8BnsEnBquewQp/uGZLAq03EWbQ5tNtJaBubUrJMfr2cjF5c0sBwhi+Imyv6OYYPY+W1L4/S+5x65zKJSSjtvJfYev06GUf2Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755541954; c=relaxed/simple;
	bh=PMrFtdhKmmyHtEZteHovmwk7L6sk3r4j2HPoHrkf/Co=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=d5l+rE7hLoLfHLhEAp+s+HWfdjTscANfcNTTT7W9StT6fpylaIScSKNjTWrLvducUUbsOFWtbX3sAaNCFjcKylvtYJR7GDabtsnMNsktGCHRoirWPKA8o1833MpzABj8rdt7i/Acn1T5ka1A6u2tDrAQKdPl2o/FPewVbADhvTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=dLYDnEEQ; arc=none smtp.client-ip=198.37.111.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1755541949;
	bh=PMrFtdhKmmyHtEZteHovmwk7L6sk3r4j2HPoHrkf/Co=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:From;
	b=dLYDnEEQBxH2KPdZLYnm7QvAfXSn2l6Fn+/F5yXQ8nBAs14E6owm/W+WKt/ZOYJDT
	 psS4GvGOgljfO1j43P/EIVW26Hl5eyk9PunKIaF0FG58T9dUftZQM6tkupJJL33JXh
	 PtZsappIRVqSy5vuFvtUczl1C7XFpzA9R22ElKys=
Received: from ehlo.thunderbird.net (unknown [IPv6:2a00:23c8:101a:bc01:2ca6:6915:404f:16ff])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lamorak.hansenpartnership.com (Postfix) with ESMTPSA id 6F59A1C0234;
	Mon, 18 Aug 2025 14:32:29 -0400 (EDT)
Date: Mon, 18 Aug 2025 19:32:26 +0100
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
CC: paulmck@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Sasha Levin <sashal@kernel.org>, Jiri Kosina <jkosina@suse.com>,
 ksummit@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BMAINTAINERS_SUMMIT=5D_Annotating?=
 =?US-ASCII?Q?_patches_containing_AI-assisted_code?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAJZ5v0iBLndaGmF=_VHy8bi5F7Ey0Ov+pCtd2Wt9+_uAkW1e-A@mail.gmail.com>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz> <aJJEgVFXg4PRODEA@lappy> <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org> <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop> <c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com> <CAJZ5v0iBLndaGmF=_VHy8bi5F7Ey0Ov+pCtd2Wt9+_uAkW1e-A@mail.gmail.com>
Message-ID: <F9AF2AA7-0E12-43E9-A34C-2D45CA591DEC@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On August 18, 2025 6:53:22 PM GMT+01:00, "Rafael J=2E Wysocki" <rafael@kern=
el=2Eorg> wrote:
>On Tue, Aug 12, 2025 at 10:41=E2=80=AFAM James Bottomley
><James=2EBottomley@hansenpartnership=2Ecom> wrote:
[=2E=2E=2E]
>> But the bottom line is that pure AI generated code is effectively
>> uncopyrightable and therefore public domain which means anyone
>> definitely has the right to submit it to the kernel under the DCO=2E
>
>Well, if it isn't copyrightable, then specicially it cannot be
>submitted under the GPLv2 which is required for the kernel, isn't it?

No=2E Public domain code can be combined with any licence (including GPL) =
because it carries no incompatible obligations since it carries no obligati=
ons at all=2E  You can release public domain code under any licence, but yo=
u can't enforce the licence except on additions or modifications because th=
e recipient could have obtained the original from the original obligation f=
ree source=2E

Regards,

James

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E

