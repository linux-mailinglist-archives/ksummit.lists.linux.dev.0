Return-Path: <ksummit+bounces-2363-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7524FB53C0F
	for <lists@lfdr.de>; Thu, 11 Sep 2025 21:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26C71165516
	for <lists@lfdr.de>; Thu, 11 Sep 2025 19:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55DEC1DB15F;
	Thu, 11 Sep 2025 19:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qpc9RCfl"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC7F2DC79F
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 19:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757617378; cv=none; b=O8XubKbnftVOuV12gAPxtWqeW0rAKsAJf43mxzV+mZrNwT/QrZMpPp+Dl53sxGC7AcKDc7hjhecXeH9Pp/clYQuCwDKR0cCYTht/Kqd08BuiHw3R8eHG4HyIQpE9HWm67bnaIundjqr1kGmLFQE6D0XtubI6bxU5JB0lJOti8hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757617378; c=relaxed/simple;
	bh=/l1FNyVz0XVh27TNNvS7g18wDcuOqzJQhTqiTmOYUh8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GW/GXahiBRacExcJaRlU4XcfxMCPH/w0RQlny8hMq+yKfWPySjYV3Oyegwh7KBX74dqAkbRRXv+ge1MIWlyqPFSOeIPTgYWkVbjZVmd679pKA+xcKmLVbeK8FBEFC+foXb6bN0lNp5FYEhIVKHtmI2m02342Pt0X8LsJocHxpOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qpc9RCfl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387ECC4CEF8
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 19:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757617378;
	bh=/l1FNyVz0XVh27TNNvS7g18wDcuOqzJQhTqiTmOYUh8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Qpc9RCflNruABHAWoaS2aAF0THFSa5hSdMLcv0fguWIR4kSjWpKyv9ZbY3UKPknjj
	 Le9j3cMyPdp6Ake+/8KGDxw/FwDaJ0ZwiTCJ+2MgJLea824nnnbqrGOseU0aNv/7Ol
	 g0abT32k3DE1WWC7wsOwxaki6Ebk6KQ4RYcB0zPNLAu63STefUZjs4KfnCIuNwV0m2
	 SVktb2H36Rzww45yZAK/kfjQdMkI6bcj4RmeBBGRtMRsVKzu+6JTXAoDPurg3C+fes
	 lqwK7mp37HxiqcpOKCzxoWNJhM4NtBHjAg6v5b3CzIIN15mq4jPuGrxC3z9QwhdugH
	 MWjwetc2w8oKg==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3C3ECF40069;
	Thu, 11 Sep 2025 15:02:57 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Thu, 11 Sep 2025 15:02:57 -0400
X-ME-Sender: <xms:4RzDaNwarGpMhTWKFjRzzk3Uds30Vl2MfwBp_gvbS57Yvpu6rd9J1w>
    <xme:4RzDaNQzL96Tf8dh9KVTAgyg2wnsfsD8UlsaB6AsxfYJXa_HWksQ3gLbVtgCOTZYh
    3YKdbQuoeeaeMIATNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvieeliecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfnvghonhcu
    tfhomhgrnhhovhhskhihfdcuoehlvghonheskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeejvefflefgledvgfevvdetleehhfdvffehgeffkeevleeiveefjeetieel
    ueeuvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hlvghonhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvfedtheefleek
    gedqvdejjeeljeejvdekqdhlvghonheppehkvghrnhgvlhdrohhrgheslhgvohhnrdhnuh
    dpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhi
    nhihuhhksehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhonhhsthgrnhhtihhnrdhsih
    hnhihukhesihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhj
    sehlihhnrghrohdrohhrghdprhgtphhtthhopehkshhumhhmihhtsehlihhsthhsrdhlih
    hnuhigrdguvghv
X-ME-Proxy: <xmx:4RzDaH7PV1CLyqTeiTrdDRBiz0h5creSDnn3mqn8XoMhCGZTk8hj-Q>
    <xmx:4RzDaGXCN1PdBwTZiBpG4sthvSX9Iig7X7xAFTxH1ozHxodlnvjznA>
    <xmx:4RzDaODQFqEHcNCLtc9v0Rd_s5jsDiCxdUM3VNYyX1GxyPsNTX7_gA>
    <xmx:4RzDaN5Cy2xO9hSnSbUzUPiRRCImJmL5kdk-OpxbCACF68F6hj37NA>
    <xmx:4RzDaBzTczR5yT8NsiY6F2gezdjJ8XGgVHsfIWqUjbQ9BVMjxQcW-Qoq>
Feedback-ID: i927946fb:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 09B082CE0072; Thu, 11 Sep 2025 15:02:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AiuzKEH_WMOk
Date: Thu, 11 Sep 2025 22:02:35 +0300
From: "Leon Romanovsky" <leon@kernel.org>
To: "Kostia Sinyuk" <sinyuk@gmail.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: ksummit@lists.linux.dev, "Konstantin Sinyuk" <konstantin.sinyuk@intel.com>
Message-Id: <164760a7-edc9-4be7-b7ca-1729feec6da6@app.fastmail.com>
In-Reply-To: 
 <CAPpb9yn9akO=pBiQs0=xTcPGTY-XghK8nYcm0dAgQO1Es5udWw@mail.gmail.com>
References: 
 <CACRpkdaKKeD3zNXM3nazfVb2m9uwfywE_rnGy3hMxwX-Aw6stQ@mail.gmail.com>
 <a74382d8-a2bf-4534-b0ee-a97d8faabf16@intel.com>
 <CAPpb9yn9akO=pBiQs0=xTcPGTY-XghK8nYcm0dAgQO1Es5udWw@mail.gmail.com>
Subject: Re: [TECH TOPIC] UALink driver upstreaming
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Thu, Sep 11, 2025, at 21:10, Konstantin Sinyuk wrote:
> On Thu, Sep 11, 2025 at 10:42:01AM +0200, Linus Walleij wrote:
>> So this gives at hand that since this is no "ordinary" memory-mapped
>> driver, it needs its own bus and therefore intuitively its own subsystem?
>>
>> What about drivers/accel/ual where other accelerators live?
>>
>> Or if that is somehow inappropriate, just drivers/ual, don't be shy.
>
> Hi Linus,
>
> For the initial RFC, I thought to start under drivers/misc/ just as a
> lightweight entry point to get early review. But I agree with you that
> UALink fits more naturally as its own subsystem, similar to how CXL is
> handled, rather than being grouped under accel. The long-term plan
> should definitely be drivers/ual/.

So do it right from the beginning and save from us unnecessary review iterations.

Thanks 

>
> Best Regards,
>  Konstantin

