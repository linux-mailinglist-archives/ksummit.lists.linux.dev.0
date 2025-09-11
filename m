Return-Path: <ksummit+bounces-2329-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 120FFB52812
	for <lists@lfdr.de>; Thu, 11 Sep 2025 07:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B83EA173F36
	for <lists@lfdr.de>; Thu, 11 Sep 2025 05:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82235241667;
	Thu, 11 Sep 2025 05:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="y5+z/kqs"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE25023F26A
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 05:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757567606; cv=none; b=CeOwpuxTdGW8OhSmIxuD0TDOqSoSxBgELfIypL0rv1o/yDyfW6iax9nmWvv8DPOx3vI7OKk7ZlY7pzt3ijTO7lxKqR6BxxYxh4whPlP63/Ec+C0M5dso4UYFLg95rH6sk4LCdfx0x+sFyAouGYI6sQXuJLGpyePX2f/eXYOxjyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757567606; c=relaxed/simple;
	bh=V48+0Ib63nugtfMhhor97TAClzY8lg2APPA7HqKhgFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oak4zce8Ye8DUd3mRUOgV2qAz/ltiopfqEYlbAmxctdSP/DukdE7ru8lEGWYYQ/2ZV/qTPpPPlbqXi3Cf/kgy2+M9DT28BkL0ipl7D8ugZjcMjP4WG7klOy1Fi0uXRNZwlQaEhTwKnQNHWvNNW2oRfevNjzZ5jdvirA24UyLZDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=y5+z/kqs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C491FC4CEF1;
	Thu, 11 Sep 2025 05:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1757567605;
	bh=V48+0Ib63nugtfMhhor97TAClzY8lg2APPA7HqKhgFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=y5+z/kqsjYqz1VoyXHNRA5NQPLauBJ6LVwi/aQOZfbbaLaXJoQw2mFzow5JcYoQgq
	 pOaUVGOT7sc53WgHVB1EJuIMQkOQUnLxCOYQRJLsLReHT2GSrjxRCVBujeO0la0tiw
	 yo061uQ3LVNSwWyUd3R5R/kxW+Ed3cucvJslfG4s=
Date: Thu, 11 Sep 2025 07:13:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] UALink driver upstreaming
Message-ID: <2025091118-opposing-carrot-655b@gregkh>
References: <fc612440-af2b-4799-97b0-d5631380f0be@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc612440-af2b-4799-97b0-d5631380f0be@intel.com>

On Wed, Sep 10, 2025 at 10:37:03PM +0300, Sinyuk, Konstantin wrote:
> Hi All,
> 
> The UALink Consortium is defining an open, vendor‑neutral interconnect aimed
> at scaling AI workloads with low‑latency, memory‑semantic communication
> beyond PCIe. Unlike proprietary solutions such as NVLink (NVIDIA) or
> Infinity Fabric (AMD), UALink is a cross‑vendor standard and was recently
> recognized at FMS 2025.
> 
> I would like to present a proposal on what UALink support could look like in
> the upstream Linux kernel.
> 
> Key areas for discussion:
> - Core driver design: proposed start under drivers/misc/ual/ for discovery,
>   topology, and resource management.
> - Memory semantics: same‑OS and multi‑OS rack scenarios, leveraging dma_buf,
>   HMM, and NUMA.
> - Control path: AUX bus for vendor extensions, offloading real‑time sequences
>   to device microcontrollers, generic UALink interface.
> - Security: confidential compute support and a userspace daemon for topology
>   and authentication.
> - Upstreaming strategy: begin with a minimal core driver, then incrementally
>   extend toward MM integration, dma_buf support, security, and
>   cross‑subsystem work.

Do you have patches today for this new bus?  Why not start submitting
them already?  Why wait till December?

> ---------------------------------------------------------------------
> Intel Israel (74) Limited
> 
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.

You are going to have to fix that footer up to be able to send anything
to public lists :)

thanks,

greg k-h

