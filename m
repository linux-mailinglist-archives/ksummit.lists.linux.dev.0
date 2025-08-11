Return-Path: <ksummit+bounces-2116-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E61B21890
	for <lists@lfdr.de>; Tue, 12 Aug 2025 00:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0665916649C
	for <lists@lfdr.de>; Mon, 11 Aug 2025 22:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501AA19C54E;
	Mon, 11 Aug 2025 22:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="Cwzfg+O/"
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB23D1E515
	for <ksummit@lists.linux.dev>; Mon, 11 Aug 2025 22:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754952375; cv=none; b=S3fuzaY3Hr+j5HnC1A2HO42gQ/p8RdePmoDOoYqHfm54WdFZdvE2IhxkDJOziJEUmWe9VEtt+Y1XiaYkhufGsa3XP8sIgErN5nmCzKVkBAjFF1Vb5FhTrQmdIeU/cYX9roESeCRhDEISyg4saK4aZdpDxds2+T6GN/69/FPy3QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754952375; c=relaxed/simple;
	bh=s3v+5zU5oNwPsdyW74EhXwQZ1l7AORFot4UwXdtIHZM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=c9qBvhttxcW3yLurUlJ6qtAZhOszZMcyvtlfn3yCZIvDTj6I6KIJxzf8U57TRv3Hhos0x7KDoa4ajIRXPV1pIPEwghaZC5PNNFJ4eZJGDPJam7smxXtcje87hgF4SePJBya+Fcp3kE4T8wkBKKFDMUjRH4Nx5mIFsKnjWalEAww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=Cwzfg+O/; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from [127.0.0.1] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 57BMjtj43224346
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 11 Aug 2025 15:45:55 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 57BMjtj43224346
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025072201; t=1754952356;
	bh=U7KYPpVDlMaEXjfWKrnTYZGX84RijPhaO86qvwDZzig=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Cwzfg+O/4Y/rvf4KU8GannZcozJxf5C5VoblrPDojbmTWe7GFLDGJ/rIQKKViRyRF
	 w6YjSLA/W37bDFLODYUROwibdTDs3JHC4MIdRK1ijRTywCgNTmnEpL+ihhIQ7j8rql
	 swWuMIE4lPkKTwCIMfWerorT10AWv6r6Mk4rHD3qvOG8tL2C0Hjhm/A9iijnvfOEDF
	 g9pfMg0EzrBgw6Spi3B2bJl94caVc8bW3zNlgjbW0bXRM4kAttoR3JmoVZYTI9CeyJ
	 kHLBsxh62h8mrZu/XGXsNzEMSYYzlEMnysAHak3fo8xzI25rbE2tWBvFHpDmh6LoEv
	 go4H3clEY1/tg==
Date: Mon, 11 Aug 2025 15:45:54 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: paulmck@kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
        "Luck, Tony" <tony.luck@intel.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
        Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BMAINTAINERS_SUMMIT=5D_Annotating?=
 =?US-ASCII?Q?_patches_containing_AI-assisted_code?=
User-Agent: K-9 Mail for Android
In-Reply-To: <cad0806b-3a87-4630-b19a-bbe8d9db1701@paulmck-laptop>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz> <aJJEgVFXg4PRODEA@lappy> <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org> <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop> <aJpnStlxDUsGNPuA@agluck-desk3> <cad0806b-3a87-4630-b19a-bbe8d9db1701@paulmck-laptop>
Message-ID: <A7310727-3DAF-4AF0-8E82-6AD17F5E94AC@zytor.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On August 11, 2025 3:12:25 PM PDT, "Paul E=2E McKenney" <paulmck@kernel=2Eo=
rg> wrote:
>On Mon, Aug 11, 2025 at 02:57:30PM -0700, Luck, Tony wrote:
>> On Mon, Aug 11, 2025 at 02:46:11PM -0700, Paul E=2E McKenney wrote:
>> > On Fri, Aug 08, 2025 at 10:31:27AM +0200, Krzysztof Kozlowski wrote:
>> > > On 05/08/2025 19:50, Sasha Levin wrote:
>> > > With AI you do not have to even write it=2E It will hallucinate, cr=
eate
>> > > some sort of C code and you just send it=2E No need to compile it e=
ven!
>> >=20
>> > Completely agreed, and furthermore, depending on how that AI was
>> > trained, those using that AI's output might have some difficulty meet=
ing
>> > the requirements of the second portion of clause (a) of Developer's
>> > Certificate of Origin (DCO) 1=2E1: "I have the right to submit it und=
er
>> > the open source license indicated in the file"=2E
>>=20
>> Should the rules be:
>>=20
>> 1) No submissions directly from an AI agent=2E The From: line must
>> always refer to a human=2E
>>=20
>> 2) The human on the From: line takes full responsibilty for the
>> contents of the patch=2E If it is garbage, or broken in some way
>> there's no fall back on the "but AI wrote that bit"=2E
>
>Another option is "The AI was trained only on input having a compatible
>license=2E"  Which, to your point, would to the best of my knowledge cut
>out all of the popular and easily available AIs=2E
>
>There might well be less restrictive conditions on the AI training data,
>but I am not qualified to evaluate such conditions, let alone construct
>them=2E
>
>							Thanx, Paul
>

I think we need legal advice on this, but I think this is a *really* impor=
tant issue=2E It could end up being a very ugly mess otherwise=2E

