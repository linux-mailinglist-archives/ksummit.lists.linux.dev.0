Return-Path: <ksummit+bounces-749-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C3D58E910
	for <lists@lfdr.de>; Wed, 10 Aug 2022 10:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2DD61C2098C
	for <lists@lfdr.de>; Wed, 10 Aug 2022 08:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB8F17D8;
	Wed, 10 Aug 2022 08:50:34 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B1217CE
	for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 08:50:32 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id EE9565C03FE;
	Wed, 10 Aug 2022 04:50:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 10 Aug 2022 04:50:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1660121431; x=1660207831; bh=IeZJEFNwj/
	VdPGU0xS4noMI2zX4SBKDyjp4Prx352+w=; b=ptKtrcorO7jPWdCnnDGAQgnPXx
	hrXLlU1nVp1B80aLNCgV/xaVJ5CCekM5YkFp0ub09S2DH7kH2e1gfXYi/yko5Adu
	3PBUrYZ9LgBrFlQ5yte6J+IdI8obRzphPccqIyNnAdxkGKpyy/yxdpnA1/5XM83b
	MEC3EJ3+0heYYULyJ2/yjmaeV8T3HE4kZczWZm4TUw8lnI/CXL6IHKo6gWlAjNPA
	0e2cTroP75ccgccWjsA2LQ69HzgkbsAAuRJEjsmosCVznkGiajfZZH3PX5I7jiIp
	eelmOKWERkM3u4noIJabssluhDZeNFOfqkBrQViyTMAEINzBfEziZYByb+vQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660121431; x=1660207831; bh=IeZJEFNwj/VdPGU0xS4noMI2zX4S
	BKDyjp4Prx352+w=; b=vZ+HHeFRYWq7NAQRzXZWn7oVKJwaWifiHS5U8gfPTDEY
	Z+OUcM5UMV5g5U9dUl1T4vWWT8lnON3Py/FpMvTyn+dJ6dgeTTdoDAhEQyHRwEX8
	+XLMMuKLVIIoAT/57liO5PNarorddRJCDIbSi5nKMMEij0iGE6JBVBMiYzGRlrbg
	zH+3+dlc8KLJbbMUTJcIS5ULuTH9OETQVq904tNpsy/EheSQ+DJwk7sgtIA3BCkk
	cjarwbmxDLzc8fWc23uqJUoP+NBo+GaOBfiKOgyXOd4PdX7h5yX6fMMM6QUGAY2W
	ebyeHQ4dzqLPyQuz0RY/udLOVmw5T13JC9C20vnPCg==
X-ME-Sender: <xms:V3HzYjlZkIB_GvA5YcRnmStneaylXsLeWSwZOyGXNyb1maBLAR2vLg>
    <xme:V3HzYm1PIWR3REA-FqgriflKgHd88afsf3qRWppEYJLFuh743U3WKU65iLmpHU2Qw
    u2VO2KNhTcCJQ>
X-ME-Received: <xmr:V3HzYpoXZ0XLvcHupepOkifozvOnNfi4dHXV8UCG33ejtfAHkhqQqvcZPauGKppwl4xkkCBU31etmdDrHXHqstEhrKtVqhKx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegvddgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:V3HzYrnU9L5xVuISLhKm_YAmyzAl9cMVgM5SvG8zb9hxCk9X3jkRTg>
    <xmx:V3HzYh2NLAqBexuyg7Yx7l4m03zyzDRXK7HsDmsqS6W2PAJDxFYmrw>
    <xmx:V3HzYqu_YhmPSCTFd5upewO1zoLsi6QHU2h5FN0gmhFHqiNzWcG4sQ>
    <xmx:V3HzYsQTm73qBiPoY4tzpYVSLDDI5vreJA8mx2vEuHtC7xmktErw1g>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Aug 2022 04:50:31 -0400 (EDT)
Date: Wed, 10 Aug 2022 10:36:45 +0200
From: Greg KH <greg@kroah.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stephen Hemminger <stephen@networkplumber.org>, ksummit@lists.linux.dev
Subject: Re: Validating MAINTAINERS entries?
Message-ID: <YvNuHXePj53gJPKX@kroah.com>
References: <20220809171316.1d6ce319@hermes.local>
 <20220810082640.GK3438@kadam>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810082640.GK3438@kadam>

On Wed, Aug 10, 2022 at 11:26:40AM +0300, Dan Carpenter wrote:
> On Tue, Aug 09, 2022 at 05:13:16PM -0700, Stephen Hemminger wrote:
> > Several times in the past, when using MAINTAINERS list either automatically
> > (or from manual entry) have found the mailing address in the file is no longer valid.
> > 
> > What about doing an annual probe mail to all maintainers and sending
> > a patch to prune out any addresses that auto respond as dead.
> > This won't catch ghost entries but would find any dead ones.
> > 
> 
> Also we could add a RETIRED file or something for when people retire and
> don't want get_maintainer.pl hassling them.

Isn't that what CREDITS is for?

