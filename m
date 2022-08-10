Return-Path: <ksummit+bounces-748-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB1B58E90F
	for <lists@lfdr.de>; Wed, 10 Aug 2022 10:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 460561C2098D
	for <lists@lfdr.de>; Wed, 10 Aug 2022 08:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732AE17D4;
	Wed, 10 Aug 2022 08:50:30 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C879A17CE
	for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 08:50:28 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id A73C65C022B;
	Wed, 10 Aug 2022 04:50:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 10 Aug 2022 04:50:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1660121427; x=1660207827; bh=Mn7hBSEhvg
	zlsbBENVS9Ab++V4tMMQam1V+vLvu584g=; b=laQmv4BPhMnYKkbzP9WI2sHpIo
	81RWOOU/yNXYCZ4Bcvd1Pb6jEqK/vabOh3AKILjqqxmg/q+1b19Rg0D+CYopgSEZ
	BEzuuwr7p8SS7j2lq08tG7S/CbrOy295fxfWNz9V4uj3rvpD/a04qKhrQ6fVtcZM
	mXmeeGhR4VtsbEDydE3D1Ac6yPA293c3zSsuTznnRF7iF1HXkBL/ZI9brssyyxHT
	HPo224pAL1IZF6s/XODlaEuBXrW41aYY389xsuGt3IAUM9Mv7EKwNKAomCOm2Bhu
	n0tSXs7jNE48Mim37cXgDnk747UZsH2sITQ5XdnZJzExZV9EyeM20b6wRHMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660121427; x=1660207827; bh=Mn7hBSEhvgzlsbBENVS9Ab++V4tM
	MQam1V+vLvu584g=; b=3Cqh5h8NMRJsxhJROi33jStDUT1GkOUwaoRGal66ZwnE
	bIazyq+WuOq7MOHHStI+ay3//pwTNCZd2OZ61V4BpaP9XVo4VgYcnv7fAdOu69i5
	JdefUwdd8ZHvxgQbu8EUkl2+DswNYe6JP1bHRkDlAeBkiIc2ODWxBb+oRgV45HWg
	pVYZ981wtH3A0k8AtntkAPRXUXIcHz+++XSnJocvXmPoqBEKuvYopaf7Bqm22QfB
	WHxPUaEjzZuRhC3W9qrSxrfj691VFsI6kyeHWibC7JQK9RCgnq092K2y/I0S/9FZ
	6wJe1AdRBbMPbWNQDDO/AL+7pUlP3QYhD1EhSXspmg==
X-ME-Sender: <xms:U3HzYmoZ3AqhpoEYDVc_W7m5TOQ1473Jo5a4eK4ZtaOHjggVnWqgiw>
    <xme:U3HzYkoqOgDWl-cI6yaCrrYMwrCZ5VDDgdoxIk8N0j9_gmy86j6QhNlvC3mJPq0o7
    Z2FgLrmx2yhyA>
X-ME-Received: <xmr:U3HzYrPVWnrdO-yPN1C2fOa8bGfL0igxmSSAOsvdCHsZWSD76QjNdnbXQNwztpcFenqQev67dV7jJa4Jrmv40ks80fQlXFTG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegvddgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:U3HzYl47kzQXtbS6FZpfz67zr96RiQrcrgL6CoAnc95JiBxDxwmvQA>
    <xmx:U3HzYl5_8iREHSwxeUX5t355F0yHF2iCo-yM7WSl1Ai5oxmtIn_JPQ>
    <xmx:U3HzYlhLPQmSGRfZ88Ulx5FocY3ouh36Fw8CxoPwkmjk5-y7bhKUOQ>
    <xmx:U3HzYlHavuehDxGXLJ-gxewiFIkIowVGb3b_Mh5nB4IOSVbLcITjaw>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Aug 2022 04:50:27 -0400 (EDT)
Date: Wed, 10 Aug 2022 10:23:04 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: ksummit@lists.linux.dev
Subject: Re: Validating MAINTAINERS entries?
Message-ID: <YvNq6D5pqL6S1ZIu@kroah.com>
References: <20220809171316.1d6ce319@hermes.local>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809171316.1d6ce319@hermes.local>

On Tue, Aug 09, 2022 at 05:13:16PM -0700, Stephen Hemminger wrote:
> Several times in the past, when using MAINTAINERS list either automatically
> (or from manual entry) have found the mailing address in the file is no longer valid.
> 
> What about doing an annual probe mail to all maintainers and sending
> a patch to prune out any addresses that auto respond as dead.
> This won't catch ghost entries but would find any dead ones.
> 
> 

Yes, it would be great to sweep the MAINTAINERS file once a year or so.
I know others have attempted to do it, but no one has really stuck with
it.  There's no real reason why anyone can't do this if they want to
send the patches for it.

thanks,

greg k-h

