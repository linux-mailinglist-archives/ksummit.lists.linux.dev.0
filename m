Return-Path: <ksummit+bounces-2782-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1E9D3994F
	for <lists@lfdr.de>; Sun, 18 Jan 2026 20:12:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 451E9300B825
	for <lists@lfdr.de>; Sun, 18 Jan 2026 19:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2019C27144B;
	Sun, 18 Jan 2026 19:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsJ2dN2C"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A233C17BCA;
	Sun, 18 Jan 2026 19:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768763549; cv=none; b=lEQkSBELxF2gaRf8O+uYn0LhYzAz5ulchI/phkjoAPcBx6JYHVpsVxCNnDoT32ECKUOFHBJeTYcuBHbQj80d/MpaX/HRzE5TKYFSR22vzgk+NBZ3y+FYzAcUzrBgsAcaq0NFHyuxyuYbaGO4srqeGFAPoyc3/CywHmT965ZGE4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768763549; c=relaxed/simple;
	bh=QlGjU+xOiN1gnFNz/pVQI8fMJ3bEb+wR/xbROmy/6Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YR8Jv80NJ2jr4Xz1OSWq/4eDKlXFZo42RLgwR1gelX0SQNsaQixqgFUCb1e6xcgEtNWpWaNmN9iViS2mKIw0dVlw6OA6BI6wnj1LaDwzsbTt/0W01NmFVf/r9iId/Ko84eGY0MJpUUGjLe4RRpHUwHlecn/+eirLmeXSeMKu4T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsJ2dN2C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399E9C116D0;
	Sun, 18 Jan 2026 19:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768763549;
	bh=QlGjU+xOiN1gnFNz/pVQI8fMJ3bEb+wR/xbROmy/6Es=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=jsJ2dN2CnRe2UO+AgdZANAK+J4b7N0JxxTP1zNiVK0DhIkNmbYOGS0HVEh8NdU8wb
	 d7GzXFNzjNSKYRX4yp+/MA8pvfnY9IY8KopNAqkC5Ud9S8D0AHClqjP03DKO/hd7ax
	 N8m2mhDcxlmb7A8U0jXpb3Di7sotSAOYmDQf6oRzsNwAPP1UJ/IsKBh5X3zeMZThsB
	 EF/dzfU9jar+3DZ2cEuQkCepgNx3rA4V0ENGGRTIdJVz1Zcua5J8gawNGCyE49SbN/
	 ajmEDO1fTdXvcljB7C88OzDpHS1zdnqbeNDMtKOgxbr0tQvgcegc3QgAvgNTLJAMUj
	 Bq6Twhp4R81zw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id BA56ECE0BA5; Sun, 18 Jan 2026 11:12:28 -0800 (PST)
Date: Sun, 18 Jan 2026 11:12:28 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Alexey Dobriyan <adobriyan@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: Clarifying confusion of our variable placement rules caused by
 cleanup.h
Message-ID: <43b01411-5125-4e23-a6ed-d9e818944557@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
 <7b37e1cb-271e-49fe-a3ee-5443006284e1@p183>
 <aVUUXAKjiNroU5tR@black.igk.intel.com>
 <20260102095029.03481f90@gandalf.local.home>
 <38d7b19f-b6ff-437b-bc88-fa2047ca556a@p183>
 <20260118110454.4d51a50a@robin>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260118110454.4d51a50a@robin>

On Sun, Jan 18, 2026 at 11:04:54AM -0500, Steven Rostedt wrote:
> On Sat, 17 Jan 2026 19:23:07 +0300
> Alexey Dobriyan <adobriyan@gmail.com> wrote:
> 
> > Such rules for headers are mostly harmless -- headers are supposed to be
> > idempotent so ordering doesn't matter. But if ordering doesn't matter
> > why have a rule at all?
> 
> As I mentioned, for aesthetic reasons only. If code is easy to look at,
> it's easier to review. Especially for those with OCD ;-)
> 
> > 
> > Duplicate header are trivially caught by tooling.
> > 
> > But such rules aren't useful either -- I've seen that Python IDEs hide
> > import list by default (and probably manage it) because it is not "real"
> > code.
> > 
> > Rules for initializers can be harmful because ordering affects code
> > generation.
> 
> I agree. I still prefer the upside-down x-mas tree approach for
> declaring variables, but obviously if they also get initialized, then
> that trumps aesthetic reasoning.

Alphabetic order.  Works for Kconfig "select" statements.  ;-)

							Thanx, Paul

