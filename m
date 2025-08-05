Return-Path: <ksummit+bounces-2062-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF001B1B9DC
	for <lists@lfdr.de>; Tue,  5 Aug 2025 20:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D53F189B792
	for <lists@lfdr.de>; Tue,  5 Aug 2025 18:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C310293C5C;
	Tue,  5 Aug 2025 18:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="K33DZGXr"
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE656294A17
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 18:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754417461; cv=none; b=Masvn6mu905G4C1GMPCDOYmqDarkXGkKnrReL0WQ/esR3aIDqTgxm0xZgYj7BmLkMj5z5d15Kwpy3lCp7Sc1WnH8IdrKirbst4oQix06LfQ4SXoSihLpjeh4sMKgwL9grf0XrI70N2VKW1PnnOrJ9wSXPwBZ6D8JTeKa3Fo8dwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754417461; c=relaxed/simple;
	bh=4mOsJ4G57unfNMOlqJyrg297/pnJZPe/SPCIDro8iGA=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=eYs+p6m3Fp8HgQiNfqRuGCgg4mhcEhciliLYyxNnkCtIs5bpSdod6loIxkidPXWsoESPdEsMTPk0CkMeedsFRF5rcioObFs6X9hhN7HLFYGEF5plD83dTVAbK2TtiUp7zQ41glcVv/T8/lrmT89QTUzxUMlP17QTec2hAkU5wcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=K33DZGXr; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from [127.0.0.1] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 575IAqMM2071378
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 5 Aug 2025 11:10:53 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 575IAqMM2071378
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025072201; t=1754417453;
	bh=eNLnogCO9rYo+Q9wpZ9lZJvyvT8TpQcuOWiARErNGTk=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=K33DZGXrKH+XIDj1pRGnvBe2aCNwjx61BGxfceNclZ+f8yEA71W7lAKzSQ2HvW+w+
	 aj9kqxRxKeV3dlEDjhIIvsJHayXqW+MSZ9DqjrEdry87U5mDwnUriFYpS/wzEAU0bR
	 G8qIxXkIBmoZ31cwsGKkQ7x0T1rqKDTErVDZOGiwfWBr68Od32SYzUIqqYbedk+b4T
	 2ULjAuf3GIQl6tibsHqgQeLhaum1qAquYyBR8yi4W45cerkxyZJFDx1I4NbiEQwJKT
	 quknVg9vof+rm0gG7te281Am6aK6Y0VWBFiDuosaI/eqnWi0TXT3EfDQShzzuqYB4b
	 6VhDvfU6jV9Lg==
Date: Tue, 05 Aug 2025 11:10:51 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, ksummit@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BMAINTAINERS_SUMMIT=5D_The_role_o?=
 =?US-ASCII?Q?f_AI_and_LLMs_in_the_kernel_process?=
User-Agent: K-9 Mail for Android
In-Reply-To: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
Message-ID: <37BCAD5A-07C4-4119-89C2-D3A45C24DE18@zytor.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On August 5, 2025 9:03:18 AM PDT, Lorenzo Stoakes <lorenzo=2Estoakes@oracle=
=2Ecom> wrote:
>Unavoidably, LLMs are the hot topic in tech right now, and are here to
>stay=2E
>
>This poses unique problems:
>
>* Never before have people been able to generate as much content that may=
,
>  on a surface reading, seem valid whilst in reality being quite the
>  opposite=2E
>
>* Equally, LLM's can introduce very subtle mistakes that humans find
>  difficult to pick up upon - humans implicitly assume that the classes o=
f
>  errors they will encounter are the kinds other humans would make - AI
>  defeats that instinct=2E
>
>* The kernel is uniquely sensitive to erroneous (especially subtly
>  erroneous) code - even small errors can be highly consequential=2E We u=
se a
>  programming language that can almost be defined by its lack of any kind
>  of safety, and in some subsystems patches are simply taken if no obviou=
s
>  problems exist, making us rather vulnerable to this=2E
>
>* On the other hand, there are use cases which are useful - test data/cod=
e
>  generation, summarisation, smart auto-complete - so it'd perhaps be
>  foolish to entirely dismiss AI=2E
>
>A very important non-technical point we must consider is that, the second
>we even appear to be open to AI submission of _any_ kind, the press will
>inevitably report on it gleefully, likely with oversimplified headlines
>like 'Linux accepts AI patches'=2E
>
>The moment that happens, we are likely to see a significant uptick in AI
>submissions whether we like it or not=2E
>
>I propose that we establish the broad rules as they pertain to the kernel=
,
>and would like to bring the discussion to the Maintainer's Summit so we c=
an
>determine what those should be=2E
>
>It's important to get a sense of how maintainers feel about this - whethe=
r
>what is proposed is opt-in or opt-out - and how we actually implement thi=
s=2E
>
>There has been discussion on-list about this (see [0]), with many
>suggestions made including a 'traffic light' system per-subsystem, howeve=
r
>many open questions remain - the devil is in the details=2E
>
>[0]:https://lore=2Ekernel=2Eorg/all/20250727195802=2E2222764-1-sashal@ker=
nel=2Eorg/
>

It would seem to me to be far more useful  to get AI to help find hard-to-=
see but perhaps common problems, or tidying up code (like Coccinelle on ste=
roids=2E)

Things that are easy to see post hoc are correct, but can be hard or labor=
ious to do=2E=20

Another genuinely good usage for AI is for especially non-English speakers=
 to tidy up their patch comments and other documentation=2E

