Return-Path: <ksummit+bounces-1511-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1479D93E4BB
	for <lists@lfdr.de>; Sun, 28 Jul 2024 13:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6F181F21C49
	for <lists@lfdr.de>; Sun, 28 Jul 2024 11:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA74374C4;
	Sun, 28 Jul 2024 11:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vmZOIyAw"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F2D33986
	for <ksummit@lists.linux.dev>; Sun, 28 Jul 2024 11:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722165535; cv=none; b=E+Mz39siAVh5yhhpPk6ZndOAgkfERvR7zCXj75w4MpGLB7nkJE4HKmlz43OTwV/QJ0E+fv95uD5uf88D28UOEKZu9XDDL6W1f9VxkYj0UsdO6V+vCdbDtYV+4ad3q1aB9pWu4g1SrzyR5kYIWH9WnK2Nf2dhREzRWbBx41a71c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722165535; c=relaxed/simple;
	bh=T663exKYveMqk6rqHd1mdTsDA7s1HK5JOAmMCg4oWvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvPGIUNJAbnzRgRg3Z40Aj5zjILs9bgtdoNwAwAWu4DySA31F3RO6CIWy0E+fLJ9/kwJcaKlQYss/TjF9qkf9meeXLIGFvZbux8VUH87wYqA7r+COhBi+dHM27IcAw43auN/sEQfS9gVt6ZkR8FUG/WzcbdEtXvT+L7jab7c1GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vmZOIyAw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0AA963F;
	Sun, 28 Jul 2024 13:18:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722165480;
	bh=T663exKYveMqk6rqHd1mdTsDA7s1HK5JOAmMCg4oWvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vmZOIyAwBz185AAZMyCDcCmbwiIOXHBY+y/Ws+nI2bj/nSDWzAwoxvNu713sdPeOE
	 uO2PNrKlB4+oJkKXEIhF65u9gPcmic/ACzSmGt/SyJm3LCP6GLuwNp7JA+MynLOltO
	 G1bjoCWPPF0IyoO1U9UKYbzEbsfJ0Q3gPtREqMG4=
Date: Sun, 28 Jul 2024 14:18:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: ksummit@lists.linux.dev, linux-cxl@vger.kernel.org,
	linux-rdma@vger.kernel.org, netdev@vger.kernel.org, jgg@nvidia.com
Subject: Re: [MAINTAINERS SUMMIT] Device Passthrough Considered Harmful?
Message-ID: <20240728111826.GA30973@pendragon.ideasonboard.com>
References: <668c67a324609_ed99294c0@dwillia2-xfh.jf.intel.com.notmuch>
 <20240726142731.GG28621@pendragon.ideasonboard.com>
 <66a43c48cb6cc_200582942d@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <66a43c48cb6cc_200582942d@dwillia2-mobl3.amr.corp.intel.com.notmuch>

Hi Dan,

On Fri, Jul 26, 2024 at 05:16:08PM -0700, Dan Williams wrote:
> Laurent Pinchart wrote:
> > I know this is a topic proposed for the maintainers summit, but given
> > the number of people who seem to have an opinion and be interested in
> > dicussing it, would a session at LPC be a better candidate ? I don't
> > expect the maintainer summit to invite all relevant experts from all
> > subsystems, that would likely overflow the room.
> > 
> > The downside of an LPC session is that it could easily turn into a
> > heated stage fight, and there are probably also quite a few arguments
> > that can't really be made in the open :-S
> 
> A separate LPC session for a subsystem or set of subsystems to explore
> local passthrough policy makes sense, but that is not the primary
> motivation for also requesting a Maintainer Summit topic slot. The
> primary motivation is discussing the provenance and navigation of
> cross-subsystem NAKs especially in an environment where the lines
> between net, mem, and storage are increasingly blurry at the device
> level.

Would there be enough space at the maintainers' summit for all the
relevant people to join the discussion ?

-- 
Regards,

Laurent Pinchart

