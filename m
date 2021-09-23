Return-Path: <ksummit+bounces-632-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id A4332415C8C
	for <lists@lfdr.de>; Thu, 23 Sep 2021 13:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 732303E0FE8
	for <lists@lfdr.de>; Thu, 23 Sep 2021 11:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0AD3FCF;
	Thu, 23 Sep 2021 11:10:20 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D1F3FC7
	for <ksummit@lists.linux.dev>; Thu, 23 Sep 2021 11:10:19 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 508D03201D2E;
	Thu, 23 Sep 2021 07:10:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 23 Sep 2021 07:10:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=LhelprG3V5fcbvzFCVo5rY/FZ4i
	xtM+OzyOmdWcIqko=; b=g3s8rAzg6oEx9LqbtASwu0pCUqhHwFZ4lyduvah6evf
	TWj8XJBiQO9mXHaxHG41g4d6h916kB0BBPx6nESd4/X1KMNMN+kk/rfFcGdKZ0Bl
	x8nxrZYyvsw13ideFbg0DeKinTDYksNZto3xxZqGgt2aySJ9kSIGVbwAjprlQrnY
	8B4/prra0Fw16uZDzvFUs1Bh7YmMy4lAKe0hhfaI0chQiQjRaTPPvpqGU6vDNDzS
	w4xrI5k19+TKYwIDgt0xkZzZglnr4feawasNM65w2mZLZxXFhjKjIepTivMzVZEl
	qhHvqCm7MrKsLcSFYNz7LG6s8nCpAVGn5onY3GRmRlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Lhelpr
	G3V5fcbvzFCVo5rY/FZ4ixtM+OzyOmdWcIqko=; b=HedypMnbXNqg66WVQFYH2/
	SqrvruRSHrBOUe2wSx/muF/7Zv/wg77WDwC+7MaNgbcjPzi0M4XE8NY2X1RHARwJ
	pBnnR3ssr2Wx7LRFyakAoBmYS2ppmLkHA3wbcg97Myy8BYuDiMPoQwJZteozj6UI
	Gr9O8B8VulREtXwVDpmiwypZX4unGbEa2Wi05IGfrH396EOjIaBhk5TV4HrAgKF9
	ZZSyw6OOAbY1Cx82zdCLruFRFg6Hx5sOBSl8OCpwkx3UBnEHKAD0H/O7sIIOsxWh
	YIbVVFotdRdvdJwqzqoMy32r7rQ4bMqiLezxqEzBtZxEI2+zypBy4fF0hRdb5d+g
	==
X-ME-Sender: <xms:mmBMYd8KKxc5TKqr8R6e8KzzQ8Swb1Gdx8QyjivrzF_HpX4f0IodVA>
    <xme:mmBMYRsXojj3WcNRmAXKQRCrtJt9misU2mcxJo6H-tMb5hloT_hZQ4MD6_gSSHaL3
    HQllZTP8ypaeA>
X-ME-Received: <xmr:mmBMYbBwCmwndaU-HsCycdm_4NBa27c557-RLdUbRNovK7d6TO-9Osc19vR7pOj8jrMGyM3Awf3EHISfSQF87CZeuU3ev0eY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeiledgfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuggftrfgrthhtvghrnhepveeuheejgfffgfeivddukedvkedtleelleeghfeljeeiue
    eggeevueduudekvdetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:mmBMYReH0yhvLnUgNZj2QHoMANDf03qTfRqf4ELx17GojitL7StjHQ>
    <xmx:mmBMYSPz5iRscmD0rWSL2xk4DsJ3MX8BRlsUwuQGP2bO0S9WkBYCcw>
    <xmx:mmBMYTmU8TOFA0wxj06X0VSFcZX4yi0fWVJBZU_wAIK1FsnTvo_Szw>
    <xmx:mmBMYbYhotDPZXQiuMMkIbMs9yqKP4E2dVTFtWtkphI23th4eNPX4A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Sep 2021 07:10:18 -0400 (EDT)
Date: Thu, 23 Sep 2021 13:10:16 +0200
From: Greg KH <greg@kroah.com>
To: Theodore Ts'o <tytso@mit.edu>
Cc: ksummit@lists.linux.dev
Subject: Re: Potential topics for the 2021 Maintainer's Summit
Message-ID: <YUxgmKStDpjt1BLE@kroah.com>
References: <YUwOE5ExtvMye2t/@mit.edu>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUwOE5ExtvMye2t/@mit.edu>

On Thu, Sep 23, 2021 at 01:18:11AM -0400, Theodore Ts'o wrote:
> 
> 		  Potential Maintainer Summit topics
> 
> * Reviewing how we reacted to the University of Minnesota issue
>     After Greg K-H gives a non-technical summary of what
>     happened, and we would have a discussion about what should be
>     done differently next time.

That is implying that something _should_ be done differently next time :)

Anyway, sure, I'll be glad to talk about this.

thanks,

greg k-h

