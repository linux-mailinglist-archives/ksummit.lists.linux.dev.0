Return-Path: <ksummit+bounces-2164-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B35B2C860
	for <lists@lfdr.de>; Tue, 19 Aug 2025 17:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BDDC727889
	for <lists@lfdr.de>; Tue, 19 Aug 2025 15:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247A6284883;
	Tue, 19 Aug 2025 15:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="ftm27UyK"
Received: from lamorak.hansenpartnership.com (lamorak.hansenpartnership.com [198.37.111.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500B02765EA
	for <ksummit@lists.linux.dev>; Tue, 19 Aug 2025 15:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.37.111.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755617033; cv=none; b=lBfZJwPHAqm2oh0SH8C/wjUEdq0S9XwWbB0wQM2jFJ2pr7DYQ3881JgkC2stCDIZo7pBLpfT1zJZ6n2GTKgOagxMg2kL5JYhpqWSaZ/WHwrHKs4aCx6hIIZWzkgjZoeHmXHDNeIYF3jReYKrWrn2BhruMbN0pemstZRf2/SZEUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755617033; c=relaxed/simple;
	bh=Cdsjji01jaxcuxsa8bG+72C8jNGDd8pmA2f1uT4Dd3Y=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=gKfSKDFWzqmri2h1evqwvhrZ/ET+FPHiU2HTVjYRVYwE7YTWb298BnpuZAj5+FomsMLNf6S+nSCtsyMUe4HGyFHSGkBWtkrzhvO1OpOLgnEd26kLqAYRy3Zpc7OYTR2jgUobixFfmPnzwCG1uuBlIXYeO2AjBxq8HVR1/CVO1GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=ftm27UyK; arc=none smtp.client-ip=198.37.111.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1755617029;
	bh=Cdsjji01jaxcuxsa8bG+72C8jNGDd8pmA2f1uT4Dd3Y=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:From;
	b=ftm27UyKNE7j6uzmtPVep70qpbTz0pt9RldPQNFUWeCHlFSWudefEnlm7vEZlg02B
	 jyIxBMck+iueTjBfHgrvOYoSu9Cg91KxLtrwBWWqPjExrCzhXn0DFgYJJQYLTpZXq3
	 dDkC8K+opjO/1FA+G3+kAS0GNLYRoLIQLaeXQ5YI=
Received: from ehlo.thunderbird.net (unknown [IPv6:2a00:23c8:1023:8d01:db56:7598:3eda:860b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lamorak.hansenpartnership.com (Postfix) with ESMTPSA id 985AC1C024D;
	Tue, 19 Aug 2025 11:23:49 -0400 (EDT)
Date: Tue, 19 Aug 2025 16:23:46 +0100
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
 Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BMAINTAINERS_SUMMIT=5D_Annotating?=
 =?US-ASCII?Q?_patches_containing_AI-assisted_code?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20250818230729.106a8c48@foz.lan>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz> <aJJEgVFXg4PRODEA@lappy> <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org> <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop> <c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com> <9020e75d-361f-457f-9def-330d8964f431@paulmck-laptop> <20250818230729.106a8c48@foz.lan>
Message-ID: <9383F8DB-CD38-40CC-B91D-7F98E8156C04@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On August 18, 2025 10:07:29 PM GMT+01:00, Mauro Carvalho Chehab <mchehab+hu=
awei@kernel=2Eorg> wrote:
>Em Tue, 12 Aug 2025 07:42:21 -0700
>"Paul E=2E McKenney" <paulmck@kernel=2Eorg> escreveu:
[=2E=2E=2E]
> do agree that many of the lawsuits seem to be motivated by an
>> overwhelmening desire to monetize the output of AI that was induced by
>> someone else's prompts, if that is what you are getting at=2E  It does =
seem
>> to me personally that after you have sliced and diced the training data=
,
>> fair use should apply, but last I checked, fair use was a USA-only thin=
g=2E
>
>Maybe, but other Countries have similar concepts=2E I remember I saw an
>interpretation of the Brazilian copyright law once from a famous layer
>at property rights matter, stating that reproducing small parts of a book=
,=20
>for instance, could be ok, under certain circumstances (in a concept
>similar to US fair use)=2E

Yes, technically=2E  Article 10 of the Berne convention contains a weaker =
concept allowing quotations without encumbrance based on a three prong test=
 that the quote isn't extensive,  doesn't rob the rights holder of substant=
ial royalties and doesn't unreasonably prejudice the existing copyright rig=
hts=2E

Regards,

James


--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E

