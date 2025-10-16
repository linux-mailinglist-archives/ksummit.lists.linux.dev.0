Return-Path: <ksummit+bounces-2571-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BA7BE53D6
	for <lists@lfdr.de>; Thu, 16 Oct 2025 21:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DF75A4E4188
	for <lists@lfdr.de>; Thu, 16 Oct 2025 19:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1952D9EE1;
	Thu, 16 Oct 2025 19:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="UVElyR4+"
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D262D8799
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 19:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760642979; cv=none; b=J3feJ05iFBtmpPL/MN8SO0gbEqj6suWFHKWkD51aaMrv+v/ERuZO4oPpRzucb75+p90+GtYeOetVZKErkopmbC4hOw868Iz3lSWyjH33Y7zW3Pcv+cW2d0LMWSB/GdOocijdmGE3d2Y0XqYbfOFHsu6DnFOBYO2UGesuuSshSD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760642979; c=relaxed/simple;
	bh=xUtzNbslT0b2hstsLIOQjVO0oNGnrqD+UTjPv6secBc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=gXI0jZY9OBIzqvXVzOZcMWj6Yo0xg7n3+Pw2Z4agQst1h7lBQDp0E/qeKCFXthzknK7iAbNEwr3KU4c1pxqOV5J5zmMg1YM8Bif96CYkMhez3gIobZHiwpF+CeEKaWth/fLgaCvtF1I12YYt8K64qYGFzxHb97myX2M6geVt2Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=UVElyR4+; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from ehlo.thunderbird.net ([192.55.60.44])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 59GJTNWC3218858
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 16 Oct 2025 12:29:24 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 59GJTNWC3218858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025092201; t=1760642964;
	bh=QtSaieXN6LQAIT4+QEKB+2lBJZyRwp3+xN7O6ykxN7o=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=UVElyR4+/lhygGMKucHb73ABJZRuxzbgieGnG2k6UHR7raloxALEF02bKoBCOlGWZ
	 aXss+vs/70j5DfNcOQZjcgd5VLwZUshVFlzMTkhmJecMxfBSsjfRzcer+2d+/7mMy8
	 2LECHIb+lpuIojJXj1YT1czhN7XtXZvb3dGIHuhu3QMjJxYzPayW2bb/7TcCDPWi2h
	 65XMkM7vbzBnTBPujA2RFKniO5ZhvSSgeUhHnMvPDNUUL0UVMDXNGhd8trjy3CaKbJ
	 NzmS0Y9SGZitXZxkZd0caUKUtZzCOKVxrP004p4HPadxPPA4VSVDvY8QrReeQYvYvP
	 VdZbOqQbBIwoQ==
Date: Thu, 16 Oct 2025 12:29:18 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Rob Herring <robherring2@gmail.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: James Bottomley <James.Bottomley@hansenpartnership.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        dan.j.williams@intel.com, Doug Anderson <dianders@chromium.org>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
User-Agent: K-9 Mail for Android
In-Reply-To: <CAL_Jsq+VUh2Czq5KGPBoR056rMPxF_5W8ijuieZsU4RhPFwwpA@mail.gmail.com>
References: <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch> <2025101448-overtake-mortality-99c8@gregkh> <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch> <20251015-versed-active-silkworm-bb87bd@lemur> <CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com> <CAHk-=whCgsMuZ8heJ6ma3hCM_reG9+VYWfXorC=14n59TWg22g@mail.gmail.com> <2025101631-foyer-wages-8458@gregkh> <892a58917795bf5d29394bb5123dae2a6615ca08.camel@HansenPartnership.com> <2025101639-thwarting-press-f0f7@gregkh> <ef52db7e1d08eb03376fd9343c965aab4dc71ce5.camel@HansenPartnership.com> <20251016-vehement-kittiwake-of-joy-d6db8e@lemur> <CAL_Jsq+VUh2Czq5KGPBoR056rMPxF_5W8ijuieZsU4RhPFwwpA@mail.gmail.com>
Message-ID: <D8FFF43C-C8DC-4F7B-A56E-0C00328E0179@zytor.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 16, 2025 7:58:16 AM PDT, Rob Herring <robherring2@gmail=2Ecom> w=
rote:
>On Thu, Oct 16, 2025 at 8:02=E2=80=AFAM Konstantin Ryabitsev
><konstantin@linuxfoundation=2Eorg> wrote:
>>
>> On Thu, Oct 16, 2025 at 08:29:01AM -0400, James Bottomley wrote:
>> > > Where exactly would that be added?  Are you suggesting that git add=
 a
>> > > new atom_type of ATOM_MESSAGEID or something like that?
>> >
>> > Yes, I think so =2E=2E=2E just looking at constructing a patch now=2E
>> > Regardless of the outcome of this debate it seems like a reasonable
>> > (and not kernel specific) feature to add to git=2E
>>
>> I am wholeheartedly for this approach=2E One of the downsides of the cu=
rrent
>> scheme is that Link: trailers can be pointing at multiple patch submiss=
ions
>> (e=2Eg=2E if the commit wants to highlight a related patch series), so =
without a
>> clear indication which link is the provenance link, we still have poten=
tial
>> for confusion=2E
>>
>> I recommend that we all stop beating the Link: trailer topic and sit on=
 our
>> hands until the above is either accepted or rejected by the git maintai=
ners=2E
>
>git-am already supports adding message-ID though to the commit msg
>rather than the commit itself=2E A custom pager config could either hide
>it or transform it into a lore link=2E That would avoid the need to wait
>for a new git version to trickle out to everyone=2E
>
>With a new atom_type, there doesn't seem to be a simple way to turn on
>or off a field in git-log=2E We'd need '--pretty=3Dlinus' or some new git
>config setting=2E
>
>Rob
>
>

The Message-ID is largely useless without a List-ID at least, and if the m=
aintainer picks it up directly then they will never see the List-ID and wou=
ld have to add it manually=2E=20

