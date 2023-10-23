Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BF17D3F8B
	for <lists@lfdr.de>; Mon, 23 Oct 2023 20:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C81A4B20D9F
	for <lists@lfdr.de>; Mon, 23 Oct 2023 18:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FDAB219EE;
	Mon, 23 Oct 2023 18:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="08iJPnxi"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3DC1E536;
	Mon, 23 Oct 2023 18:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0D9C433CC;
	Mon, 23 Oct 2023 18:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1698086991;
	bh=m+WlsyLq5l1Kq4y/rSEj4WsaDxO+2meb6Bp7ach1P2o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=08iJPnxihDePlRvjA//xTPdu+vZrhzsIrEZReQhg9CuciLY5QDQyTEyPEYh7wLLCR
	 rRjALXNupBFb80HLEaVq/RbTrg1MrHVpabdbmfCDXOQn9NjbRgpAVakbGBB73+kJ0d
	 /bU9CBXtF+ssadrumQEWyPtGtB0QgZiU1fCUNFok=
Date: Mon, 23 Oct 2023 11:49:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: ksummit@lists.linux.dev, outreachy@lists.linux.dev,
 kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-Id: <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
In-Reply-To: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Oct 2023 07:11:36 +0300 Dan Carpenter <dan.carpenter@linaro.org> wrote:

> Yesterday someone on my lists just sent an email looking for kernel
> tasks. 

Well here's a task: write a bot which follows the mailing lists and
sends people nastygrams if one of their emails is more than 95%(?)
quoted text.

It's happening significantly more lately.  Possibly because the gmail
client helpfully hides quoted text.

Probably not a great way of becoming popular.

