Return-Path: <ksummit+bounces-1375-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A76892B963
	for <lists@lfdr.de>; Tue,  9 Jul 2024 14:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAE5A1F26280
	for <lists@lfdr.de>; Tue,  9 Jul 2024 12:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE6F158D76;
	Tue,  9 Jul 2024 12:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwOWAzAQ"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646E1155A25;
	Tue,  9 Jul 2024 12:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720527952; cv=none; b=f8mA3Z3q4zMFvrFZz/AjPCQIgpleoxr6FumAx1vZEeZmg7q/zg50I513N/jGgioUgt8TKZ/X6XY9jh+Tr+R44oP9ghCSnEvfhmaK4d5kmVA6QrGAjlBgBzyJOWoVThfwCrD+vSIwLXltz3GPMOnaMf+zzqnSULKz0ADwIVjDH7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720527952; c=relaxed/simple;
	bh=DatjDqG5Bk0Z1300jfUHWZg7b/3EBpsvE2GpZUeXZls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwm43MsxTEIMT5MAuZ+IQ71H7sBCxq3nFeBdVKzhsnABAAJS8vnPNnxAUQP2D08M84hmNr0V0rySBRZCns8F7Gfvns/PX3BzrMIOIa6ynM//j1WQFxvqnsPQRFyG9deNzBKyCduwRZjiuJNmk3zrxNEOCWlzahi36Y4wIrqh2tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwOWAzAQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63937C3277B;
	Tue,  9 Jul 2024 12:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720527951;
	bh=DatjDqG5Bk0Z1300jfUHWZg7b/3EBpsvE2GpZUeXZls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iwOWAzAQWvNvavXSbuYiEY1UtzvsZ0fx9TZki9+x50QgVsNW6ZcUKQkQIVpshNOJv
	 Nul7L74kt9+aiEplAvfamGaV7I83Y9ADW9oy5fvwz/SYby78zxa20X7cNCsSrlQjjW
	 l29UZ/sJl4ZDPBt6DuIjRBf6A41tZ4N+8kSU68KG6GafNMMj57BSc0LYwFJNINn1b/
	 QO5gVOod55bdI0qV6n3p1UVP+ECa4yEdTHsRlcB3Y8PHL7QhcACdeFRvLX+3IVsUEe
	 ERqyUpu2MYR6Yp2P5K+LrJSmY04+SCPhlKyMRwG05z0wOqUeMn3T9mJ0htCXkWWXbB
	 MQK63QSv2iAKQ==
Date: Tue, 9 Jul 2024 15:25:47 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dan Williams <dan.j.williams@intel.com>, ksummit@lists.linux.dev,
	linux-cxl@vger.kernel.org, linux-rdma@vger.kernel.org,
	netdev@vger.kernel.org, jgg@nvidia.com
Subject: Re: [MAINTAINERS SUMMIT] Device Passthrough Considered Harmful?
Message-ID: <20240709122547.GC6668@unreal>
References: <668c67a324609_ed99294c0@dwillia2-xfh.jf.intel.com.notmuch>
 <2024070910-rumbling-unrigged-97ba@gregkh>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024070910-rumbling-unrigged-97ba@gregkh>

On Tue, Jul 09, 2024 at 12:01:06PM +0200, Greg KH wrote:
> On Mon, Jul 08, 2024 at 03:26:43PM -0700, Dan Williams wrote:

<...>

> > It sets common expectations for
> > device designers, distribution maintainers, and kernel developers. It is
> > complimentary to the Linux-command path for operations that need deeper
> > kernel coordination.
> 
> Yes, it's a good start, BUT by circumventing the network control plane,
> the network driver maintainers rightfully are worried about this as
> their review comments seem to be ignored here.  The rest of us
> maintainers can't ignore that objection, sorry.

Can you please point to the TECHNICAL review comments that were
presented and later ignored?

I don't see any, but I and probably Jonathan who posted in-depth
articles in LWN might have missed them.

Thanks

