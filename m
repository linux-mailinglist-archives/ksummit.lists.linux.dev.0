Return-Path: <ksummit+bounces-2237-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAD3B3ADEF
	for <lists@lfdr.de>; Fri, 29 Aug 2025 01:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2021F1C84CAD
	for <lists@lfdr.de>; Thu, 28 Aug 2025 23:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151DD25D1F5;
	Thu, 28 Aug 2025 23:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oZAia7O3"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0617C79DA
	for <ksummit@lists.linux.dev>; Thu, 28 Aug 2025 23:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756422091; cv=none; b=O9FgWv0e7+irKST6YE3z0mn8KNogUUvSlLIA7FDEfKxttq0XUgxDIwRAshmnIAu9pdrvAKhMKxjQ2+LT+V69Pxa0fVzh7BZllu4GTOuSx2vXgm1rKwFy0SLSsHAzu2SgJndgvX86xVEdqLO0nEVjNeQ6Cklsq+L/jNxY3rNqy6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756422091; c=relaxed/simple;
	bh=C5GSXLYbvwQGOYuI+KVG20HOtkm06nxkAO2ovn+WuEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3cBmAfDS3+JCGisDMfpb51aK2s3aGgkXp8LTbVWZOSZLYcNPYBVuC7qH16576pqoG/oDDitA3SSnOx0lJ9krPM8jXX1J1iVvvn8VY8S+FNe+iRAzSPt2yRfEJQgYKHiXcAuvbjRcfZZIh7s7E2rZYAkz9XLn8dRJwpdlqVHu6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oZAia7O3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (212-76-243-235.access.telenet.be [212.76.243.235])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 120591934;
	Fri, 29 Aug 2025 01:00:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756422021;
	bh=C5GSXLYbvwQGOYuI+KVG20HOtkm06nxkAO2ovn+WuEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oZAia7O3XPSIvq7Vypqk2K2lBR89S2DlPfKeUppRgF5DsFDIeVRSsds2Re0q4AVSL
	 Hy5tPga/cWv6TTZmvH0U919gXlPxdZZ0qLkN1CdyhsOTsexikABsX6c2ipOMAm3iVo
	 DcSjzfgn82AEw0mE/92tbpEH6XUzC16kPDHcLyro=
Date: Fri, 29 Aug 2025 01:01:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
Message-ID: <20250828230104.GB26612@pendragon.ideasonboard.com>
References: <87plcndkzs.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87plcndkzs.fsf@trenco.lwn.net>

Hi Jon,

On Fri, Aug 22, 2025 at 04:55:51PM -0600, Jonathan Corbet wrote:
> The last year has seen a massive amount of work in our documentation
> build infrastructure and continuous improvement in the docs themselves.
> This session will provide a brief update of what has happened recently,
> followed by discussion on what we want to do next.  How would we like
> our documentation to evolve in the next year or three?

One area that I think could be improved is making documentation more
accessible, in particular to newcomers. We have a really impressive (and
ever increasing) amount of documentation that has mostly grown in an
organic fashion. As a consequence, many answers can be found when one
knows what they're searching for, but reading documentation is painful
for newcomers. It doesn't flow naturally, and lots of concepts are used
before being introduced much later (or in entirely different locations).

While some documents are clearly meant to be reference material, other
target developers who are not familiar with the topic being described.
They would benefit from being written in linear, story-telling way. I
don't know how to best achieve that though: developers writing any kind
of documentation in the first place is already an achievement, and
writing the documentation while putting yourself in the shoes of someone
not familiar with the topic is not an easy task. It may actually be
easier for a newcomer than an experienced developer to do so: they would
already be in the right shoes to notice bad documentation flow. We would
however need a newcomer with a combined interest in a particular topic
and in its documentation, and with time to refactor the latter.

-- 
Regards,

Laurent Pinchart

