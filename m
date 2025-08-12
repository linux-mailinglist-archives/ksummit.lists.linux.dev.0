Return-Path: <ksummit+bounces-2144-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA47B22D02
	for <lists@lfdr.de>; Tue, 12 Aug 2025 18:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E29E1882E3D
	for <lists@lfdr.de>; Tue, 12 Aug 2025 16:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0188123D7E4;
	Tue, 12 Aug 2025 16:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJD0SKlg"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F744305E0C
	for <ksummit@lists.linux.dev>; Tue, 12 Aug 2025 16:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755015163; cv=none; b=m46SqNYublZr0/Yvvt3W/AeMadOND2APYL+wwO4EvbZ5ZOE23Rf1+38uwnNbHcbCYPPjYlIUpYIp2PdEVb8lnTmNbi4eWtyvfTfbom2nYOXVEIJdJi1r+MXqwDwXupuzEs7isQQvloBZ0vPNa9reZ8SLsX/nFfSdq89KTzrSxDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755015163; c=relaxed/simple;
	bh=PgCAYnJPSJnFcSFOMD45MYgk7PNZEojEWhDk3wNcDys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Js7FmfpNPa91KPDMfL01olD62Z/HjXXtRrmrp6Yyvng8z9AMr/o6D0Tpddlp57N3syR6NDpVTILZOIcXZVVYNn6q1OsV8qN8Dmxueh9GATcDMQjXrNoB1oyR15QztnmD9IiOnA1cwF7/wIGb8I4eGh9pQ5YX+APmJ1L5oNhKY+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJD0SKlg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51954C4CEF0;
	Tue, 12 Aug 2025 16:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755015163;
	bh=PgCAYnJPSJnFcSFOMD45MYgk7PNZEojEWhDk3wNcDys=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=VJD0SKlgHUnnhglde7bBnOdoLxNUgIBti/bcXLtWD3b1Da3shlzbVQwFYeseAT9dd
	 fI3RGZWlA5ehDYdiUb2yd+nm1dp8+cQCa9Ujytihg32Uzcu45j+I8E8zmJNEPNEHG4
	 0ysD6kQ0SdzaGc5dUp3CS/N8D6Q2XYi40+k8cuTiuspc5SspqmyCHRDQznx6MCVwBM
	 2jSPoPwXZkMQizcVBpZiiLjHyi4FTm0rA0Pd8ZVHO0TMWZ3MW97Lq9J3AsEYg2a3e3
	 t49cPCqi90InbGnpQfBGpsQhiqjDc+Xyqf4RnEyAg25pHQu70iHuQ9eNqKFPXwTmWM
	 ge8ZRrf9mw5mw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id C6E8ECE091E; Tue, 12 Aug 2025 09:12:42 -0700 (PDT)
Date: Tue, 12 Aug 2025 09:12:42 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Sasha Levin <sashal@kernel.org>,
	"Luck, Tony" <tony.luck@intel.com>, Jiri Kosina <jkosina@suse.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <743df9f7-70ff-4038-bec1-2fc938711be0@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <aJpnStlxDUsGNPuA@agluck-desk3>
 <aJpupN1KztXyglnN@lappy>
 <20250812114956.40dbb2fe@gandalf.local.home>
 <c1ea68c1-c352-40b5-a68a-790f618bb221@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1ea68c1-c352-40b5-a68a-790f618bb221@kernel.org>

On Tue, Aug 12, 2025 at 06:03:36PM +0200, Krzysztof Kozlowski wrote:
> On 12/08/2025 17:49, Steven Rostedt wrote:
> > On Mon, 11 Aug 2025 18:28:52 -0400
> > Sasha Levin <sashal@kernel.org> wrote:
> > 
> >> We have the following in our docs:
> >>
> >>          code from contributors without a known identity or anonymous
> >>          contributors will not be accepted. All contributors are required
> >>          to "sign off" on their code
> >>
> >> Which requires a real, known, human identity behind the "Signed-off-by"
> >> tag.
> > 
> > I guess the real question is, if you have AI write the code, do you have
> > the right to add your Signed-off-by to it? Especially if you don't know
> > what that AI was trained on.
> > 
> > Does the Signed-off-by mean if later on, we find that the AI used an
> > patented algorithm, the one that added their SoB can be in legal trouble?
> 
> 
> Maybe we should be very explicit about annotating AI-generated patches
> and instead of (see workflows discussion [1]):
> 
> 	Assisted-by: ....
> 
> expect different tag, like:
> 
> 	Legal-risk-by:
> 
> or:
> 	Legally-questionable-because-of:
> 
> [1] https://lore.kernel.org/r/20250809234008.1540324-1-sashal@kernel.org/

If you have to add one of those last two tags, my carefully considered
advice is to refrain from applying the patch.

Applying a patch containing the first tag might not be wise, either,
depending on the outcome of a number of lawsuits currently in flight.
Plus there are a lot of other countries that might choose to weigh in.

							Thanx, Paul

