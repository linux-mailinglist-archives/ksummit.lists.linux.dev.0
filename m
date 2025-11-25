Return-Path: <ksummit+bounces-2648-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 386AAC86583
	for <lists@lfdr.de>; Tue, 25 Nov 2025 18:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D9D7034E7A3
	for <lists@lfdr.de>; Tue, 25 Nov 2025 17:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5701E32ABFB;
	Tue, 25 Nov 2025 17:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="RQvAgm3H"
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA6F15ECD7;
	Tue, 25 Nov 2025 17:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764093450; cv=none; b=H5mvd7+md087mom8ryb8VZempLYEhPtz6twwBNv4Zkm2dci6YjSXYgu0qUOwW02pdKoTHtUpdq0EVEvbFCN9yvZh7MQSwDkvLpBSC1nnwdhjtRDODN3MIQk3bMX43S/vZjyzC8//GXsFCtQLhpFdNJqMDiMNCkLZTAqM58tasCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764093450; c=relaxed/simple;
	bh=EXKTlqui1JWJDEu8mQ765DMKQruu/piYDd+fsHF625Y=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=nSIyVwGjB771LXfwgAwHVZIkvgH4HZRIyW/XoFLFKItSBKD+FSKgauC8L/G6cUP3ifFrAb61Z5UWPofi7YnhJkWhGjvLEgSby9WdlSG5XNt5J9pghw57TS3/zPwFPscucK5qzPDnNRmoON70MhA9Y8mICZkl8afl1K9ykLztC6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=RQvAgm3H; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 5APHvLZf1468681
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 25 Nov 2025 09:57:22 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 5APHvLZf1468681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025112201; t=1764093442;
	bh=EXKTlqui1JWJDEu8mQ765DMKQruu/piYDd+fsHF625Y=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=RQvAgm3HPpDAL2FMq0G4Zp/R0mkTcqd92Oe1HOnwT9oGZMaig+U2rODMZ2ASgeHaE
	 aoEjsNOmo5r5UM/+Z03Brp9DTHdl/xqlPpgIr1TmLMzmI7lWzO6yKvPHKVMYkVNLyc
	 W/GbzZJ9VYQJRdUyh9FUr4xi8xJuv5y9519I9E4at4jj7ORM+xGHdfVF5rszg+2RKk
	 JfHn+k4CU56T58vFsf34IV3TJ3Sz8NFK7SYMa6cBieCHT/ceXVuYskj2AcolT9I8hE
	 BbDaB4BIC2dUSuKB0EW2rGPKQWoZfEAEyhXNx4VNpVQkYQww5bB0b+fEQJYRW35C5r
	 CKkMAdwmIMTpg==
Date: Tue, 25 Nov 2025 09:57:21 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Alexey Dobriyan <adobriyan@gmail.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
CC: ksummit@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: =?US-ASCII?Q?Re=3A_Clarifying_confusion_of_our_variab?=
 =?US-ASCII?Q?le_placement_rules_caused_by_cleanup=2Eh?=
User-Agent: K-9 Mail for Android
In-Reply-To: <7b37e1cb-271e-49fe-a3ee-5443006284e1@p183>
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com> <7b37e1cb-271e-49fe-a3ee-5443006284e1@p183>
Message-ID: <B92B21C0-093D-4F52-A7E3-1A7DDC83749B@zytor.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 25, 2025 6:25:19 AM PST, Alexey Dobriyan <adobriyan@gmail=2Ecom=
> wrote:
>On Tue, Nov 18, 2025 at 11:39:26AM -0500, James Bottomley wrote:
>
>> So which should we do?
>
>The best way to understand that C89 style of declaring in the beginning
>of the function is pointless rule is to write some code in a language
>which doesn't enforce it=2E You should see that nothing bad happens=2E
>
>It increases bug rate due to increased variable scope allowing typos=2E
>
>It bloats LOC -- in many cases declaration and initializer can fit
>into a single line=2E
>
>It prevents adding "const" qualifier if necessary=2E
>
>Pressing PageUp and PageDown when adding new variable is pointless
>busywork and distracts, breaks the tempo(flow?) so to speak=2E
>
>C89 style provokes substyles(!) which makes adding new variables even
>more obnoxious: some subsystems have(had?) a rule saying that declaration=
s
>(with initializers) must be sorted by length, so not only programmer has
>to PageUp to the beginning of the block, but then aim carefully and
>insert new declaration=2E
>
>None of this is necessary (or possible) if the rule says "declare as low
>as possible"=2E
>
>There was variation of this type of nonsense with headers (not only it ha=
s
>to be sorted alphabetically but by length too!)
>
>There is no practical difference between code and declarations:
>declarations can have initializers which can be arbitrary complex,
>just like "real" code=2E So the only difference is superficial=2E
>
>
>C89 declaration style is pointless and dumb, no wonder other programming
>languages dumped it (or never had), it should be simply discarded=2E
>
>It will also make Linux slightly less white crow to newcomers
>(C++ doesn't have this rule after all)=2E
>

Preventing the use of "const" is a big one=2E

