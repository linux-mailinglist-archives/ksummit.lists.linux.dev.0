Return-Path: <ksummit+bounces-1044-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE3D783C31
	for <lists@lfdr.de>; Tue, 22 Aug 2023 10:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89FFB1C20915
	for <lists@lfdr.de>; Tue, 22 Aug 2023 08:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05FC68F55;
	Tue, 22 Aug 2023 08:55:18 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B2A8C10
	for <ksummit@lists.linux.dev>; Tue, 22 Aug 2023 08:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5BD2C433C8;
	Tue, 22 Aug 2023 08:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1692694516;
	bh=JwqaqPE8Leo2D/G70veQLe3YYRpussKTwVornXV63Pc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QOerpyWiw8dgzFs/YiNry0DXYrktBcDKVxyui9W4pyrJjfivBXNkxb8HBBne75D9O
	 somEhC88+P6u8gP2lR1PzldAa6F34vglzEI0vWHqcl+Gi9KOyUAtexnqpeuqHy//YE
	 yZ2OcTGxBHUGLi5vozHEqdi7AwpxU06/4ebL+ZL4=
Date: Tue, 22 Aug 2023 10:55:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Between a rock and a hard place, managing
 expectations...
Message-ID: <2023082250-replace-rectangle-1d47@gregkh>
References: <64e404a979f54_4c1f3294d3@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64e404a979f54_4c1f3294d3@dwillia2-mobl3.amr.corp.intel.com.notmuch>

On Mon, Aug 21, 2023 at 05:43:21PM -0700, Dan Williams wrote:
> - When do vendors need to share a common ABI?

When they do the "same type of thing" :)

> - How well is our "community consensus" protocol working to give
>   contributors actionable feedback?
> - Is there more we can do to enable contributors to steer the right path
>   out of the expediency vs maintainability trap?
> 
> "Confidential Computing" is an example of an area with several
> cross-silicon-vendor implementations that continue to add features with
> a steady stream of upstream design decisions that cross multiple
> subsystems.

And the normal "you all need to get together and agree on an api
yourself, otherwise we can't take any of this" should work here, right?

Well, except for the groups that snuck stuff in before we realized what
it really was, I guess we are stuck with them.

Why not have the community "fight it out" among themselves first, before
we have to worry about it?

thanks,

greg k-h

