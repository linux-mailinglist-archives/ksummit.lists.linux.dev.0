Return-Path: <ksummit+bounces-989-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8028077D4EA
	for <lists@lfdr.de>; Tue, 15 Aug 2023 23:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1D421C20D96
	for <lists@lfdr.de>; Tue, 15 Aug 2023 21:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006AA18B16;
	Tue, 15 Aug 2023 21:11:08 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E144117FEE
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 21:11:05 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 608C4320069B;
	Tue, 15 Aug 2023 17:11:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 15 Aug 2023 17:11:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1692133863; x=1692220263; bh=7T
	CtomFqxEbstUWKDNp2oR6nIb4dz/rWCX9FlStPb0k=; b=ztlPkN8uYuVexqjQ+Z
	bPgPsX4kbq4jXyL/O5UkEzFYjeN5MbsoYqS0DdjVV/+093wR7Rf5jAdawG9vzOcZ
	z79KUHTk4h03UWwJhpcq7LCKK6H8el2OpPSCOP8Fh14kbW6gSughVFT8/pMilJS8
	u2+Fl5r5gu64EC9e49O5OZyZNaJQWQbXUvsXiaVQNZQAi19/TuKLDJjnVjbqXuRU
	vAF3fbxBfDLkU69oKU4Zmpw6FsIYoHVXllVBUGtB+RX67+t567R3lElfuGSFtWlS
	oo3IbbH0ziwY3+j9KOKoSWaQd0s0MIyBiBCPD9RtT+OrbK/NARK95aqmb9/tkuf/
	24iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1692133863; x=1692220263; bh=7TCtomFqxEbst
	UWKDNp2oR6nIb4dz/rWCX9FlStPb0k=; b=dGGy3+fRQaor8elSj0BQWLoRs8jVN
	Z9rMvJBIonnnmKY2f+6JSbVGaUYQQSjxqULGvXI4ogUIEoMVyiiXS1QB7Ojihv9y
	i8syCc+PLNLTGtD/LpV5VS8aeW95u5vjUCkk1fnMscASy95KglsGMS/HwAxNy4Xr
	ANfZyFx7c7BDkJ3Ikq0u3JSxHpuzZLReWgL6ZTlmLyy/XB05Llp+fPmgvoz6EJ6d
	1XeXF47P3AiMrffHFhQ785vBaF2aWqqpXXFbKxFsXwzytpAoBIkdcJg98OQw0QMT
	+entIwO53CNi8GqquPGjmvGLL40dqO2RQfttYea5uw+Ky8ir+L3EkJwGw==
X-ME-Sender: <xms:5-nbZAeVeA3L2wrOwoRhdhFs-d4F7APPSIu17_flycEwemBU9mYdHw>
    <xme:5-nbZCPapc4jwRcaRKFxh_NhGveHZ-Fm9LSDlpvMfvbX2K6zBnevB_lTwdflFnRI4
    BapVnT9XCu3ZQ>
X-ME-Received: <xmr:5-nbZBirPWj5z8qtWalZ-mIu1YlBkREAtKaooAbDkMan2GT5K2PiIZuhamxeiiMxQ7vXPThM0jCwaV-dQqw77aNh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddtjedgudehlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehge
    dvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhroh
    grhhdrtghomh
X-ME-Proxy: <xmx:5-nbZF_V_JiHvpeUjOnxhfp_2pAABY6-xTPF_KYLIOMvbfFA5PAc_A>
    <xmx:5-nbZMv3MZ1MxxZAPRU-wgu0fl5UDbKDLlAzSzlx-tQ2FNItJVT3Ng>
    <xmx:5-nbZMF_8czEMMNshdgz4SmkhG8Nf-n4DCAGvZFIUH7dQGkcOaZmrA>
    <xmx:5-nbZAhKYS9KWh2JnNt0mJBus2BO2ooyjvBHA1dhxBn1kCryTLRw0w>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Aug 2023 17:11:03 -0400 (EDT)
Date: Tue, 15 Aug 2023 23:11:01 +0200
From: Greg KH <greg@kroah.com>
To: Mark Brown <broonie@kernel.org>
Cc: Dave Hansen <dave@sr71.net>, Sasha Levin <sashal@kernel.org>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Quality standards for embargoed code
Message-ID: <2023081527-amendment-professed-0a42@gregkh>
References: <ZNuuvS5BtmjcazIv@sashalap>
 <53f0072b-91c0-0136-a689-f31e8508a862@sr71.net>
 <ZNvBomFMyZTYm7ye@sashalap>
 <e4d1bf8f-cbb5-935d-1a55-7650dff591ab@sr71.net>
 <2023081510-monument-sagging-2125@gregkh>
 <f7b680ae-915b-4783-a177-117553356df6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7b680ae-915b-4783-a177-117553356df6@sirena.org.uk>

On Tue, Aug 15, 2023 at 09:47:43PM +0100, Mark Brown wrote:
> On Tue, Aug 15, 2023 at 09:57:46PM +0200, Greg KH wrote:
> 
> > Anyway, the main reason we have NOT added testers (nor allowed
> > developers to use the test systems from their employer) is that those
> > test systems are able to be accessed by a huge/unknown number of other
> > people, none of who should have access to the potential changes under
> > development.
> 
> > If that can be solved, with a "private" kernelci/lkft/openssf/whatever
> > test instance, that would be wonderful.  Ideally it should be the
> > responsibility of the hardware vendor for which we are fixing their
> > broken hardware with kernel changes to provide this for us.
> 
> I think we could usefully have such systems or scripts available which
> people could use at their option as part of setting the baseline,
> ideally something based on free software so people can stand the stack
> up themselves if they want.  Probably there will be occasions when it
> gets used, if only by upstream people, and it's less stop energy to
> point people at something they can concretely use rather than a list of
> tests which people might not already know how to run.  If it's just a
> list of requirements there's more chance people might mess up running in
> ways that non-obviously don't actually test the thing.

I would _love_ a "stand this stack up myself" type of thing to have,
just that alone might solve most of this issue by allowing the
developers doing this work to "do it themselves" before even offering
the change up to the small group for review.

So consider me someone who would gladly consume this type of thing not
only for hw-embargoed issues, or for "normal" security issues, but also
for my normal development/maintainer workflow as really, they all have
the same need here.

thanks,

greg k-h

