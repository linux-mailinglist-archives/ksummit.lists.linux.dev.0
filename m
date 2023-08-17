Return-Path: <ksummit+bounces-1011-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 848FB77FA93
	for <lists@lfdr.de>; Thu, 17 Aug 2023 17:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0857B28208E
	for <lists@lfdr.de>; Thu, 17 Aug 2023 15:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289851548B;
	Thu, 17 Aug 2023 15:20:01 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E151514F65
	for <ksummit@lists.linux.dev>; Thu, 17 Aug 2023 15:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F0E2C433C7;
	Thu, 17 Aug 2023 15:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692285599;
	bh=b/VWGqLo8QYDRFrYdio2OIsZxUNrk8jLiGtSe0bmcGs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QQHuQtBQS1/atCJYsDYIUvd8QyRE1ScKMr1flplJpoR8k4jsp/QjSoqKENr1SVIPD
	 LKNz8DTipHB1OGSpKeYs3HRrcpTD9zBzNykwa6qcXAMh4NAAVbLhKvBpkswFXqDyoE
	 s28d3n7YHhBtP4/jmX+DugErYgVlaQYqKJjfvc2m3PrxZeXxDmlW+bkUPA+QfT1L3L
	 mQJsHUs+3lZGhkFcTG+ReqTQ0555nHT7AL8bVegFevk4yzQlONdHfzYBazT8nbzMB2
	 DfoJ70+zPU6JoM4+LkiqMma7gHH1UdDRgAS4KsPr/9NLMMHsk4cJRuam4ZYOG7UN2D
	 1M3GXiPNA8fig==
Date: Thu, 17 Aug 2023 08:19:57 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Luis Chamberlain
 <mcgrof@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 ksummit@lists.linux.dev, Jeff Layton <jlayton@kernel.org>, Song Liu
 <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230817081957.1287b966@kernel.org>
In-Reply-To: <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
References: <20230816180808.GB2919664@perftesting>
	<ZN0uNrpD8JUtihQE@bombadil.infradead.org>
	<20230817093914.GE21668@pendragon.ideasonboard.com>
	<44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Aug 2023 14:36:31 +0200 Andrew Lunn wrote:
> > > In so far as making it possible to get b) to help, my current excitement
> > > surrounds around what Song Liu mentioned to me at LSFMM and then
> > > quickly demonstrated that the eBPF folks are doing with patchwork.
> > > Get the patches to be tested automatically, and *immediately*
> > > patch reviewers and maintainers can get feedback if something is not even
> > > worth reviewing.  
> > 
> > This is interesting, do you have any link to share to related resources
> > ?  
> 
> I'm guessing, but i think that is referring to the "Checks" section in
> a patchworks status page. Picking a couple of patches at random:
> 
> https://patchwork.kernel.org/project/netdevbpf/patch/20230816210049.54733-9-saeed@kernel.org/
> 
> https://patchwork.kernel.org/project/netdevbpf/patch/20230816210049.54733-2-saeed@kernel.org/
> 
> Jakub can tell you more.

FWIW BPF runs more stuff, they spin up VMs and run the actual selftests,
so looking at a BPF patch will be more informative:

https://patchwork.kernel.org/project/netdevbpf/patch/20230816045959.358059-3-houtao@huaweicloud.com/

Exact details are to my knowledge in flux, the system is constantly
being improved.

