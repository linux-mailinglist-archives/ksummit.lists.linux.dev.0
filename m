Return-Path: <ksummit+bounces-2118-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B555B218C6
	for <lists@lfdr.de>; Tue, 12 Aug 2025 00:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 698323A82EF
	for <lists@lfdr.de>; Mon, 11 Aug 2025 22:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A342264A3;
	Mon, 11 Aug 2025 22:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+gh3NX8"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E781EB1AF
	for <ksummit@lists.linux.dev>; Mon, 11 Aug 2025 22:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754952778; cv=none; b=R4c0qY+dls3TgiNxv2h7Ez+mhmQf5GwjFbqkvkC8N+kb0TDQkfEc3FYJO7lQiStTlanoppTGjwyHYxx9Oxkj+jpgRwtX9feABD+r6Z5PfzSVYYVPQiV9DuZPcPhnif0QmqAVhb3WVdDUoiJC1g99IiWVYSxpphnRgyNtyF8J5pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754952778; c=relaxed/simple;
	bh=yazMtvRH+zpN8zBhsA+DO0nZDbDTyZlnL6+f/VPrynI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D81rg+2GlZaejmTmto4o3taBNsYYBjHMDir3GoVF8evMuTLsXdCF+9sPsDV1mIjcogk/8SUQIhsqK/WS2liy54TC8ShH1MgMjsBBapHkHX8xw9ePSt1A9uAVnQbvFNFebjBZrvxbEUX1hqsySI8ZAnoSJBcRavIYr19WqIRmsF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+gh3NX8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06B3C4CEED;
	Mon, 11 Aug 2025 22:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754952777;
	bh=yazMtvRH+zpN8zBhsA+DO0nZDbDTyZlnL6+f/VPrynI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=l+gh3NX8/eS6MNLgZN2LKfHeKV57phhorzD5BG+1J7WmMf29U00DFxkGfEJysOtL2
	 /e4YyAj9Sa6xsrkFbgomezWxnDvKtB7D0VlqF+qeoKJi3owpJvWvO2gN3vGXeScLUO
	 Ml4NtIDxyisp1Y0ueOUXzhNv3MNnsGhqf1Dq7Otipgw3jD3s845htMUQFgjWGvX7Rd
	 ABGCWHYi/dE5Q/w1jiS6rEdcr7oXAUMTnVhI8diwqzpOFR02Jivredjv6LYI4/IW7n
	 7tGv9DITtYjSFQzwgEQNRZmOz0O/OOi1y2TWJ87ou1Pj653LwalqovdZDA/BNx77yA
	 lM2GsQOtna33Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 906AECE0965; Mon, 11 Aug 2025 15:52:57 -0700 (PDT)
Date: Mon, 11 Aug 2025 15:52:57 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: "Luck, Tony" <tony.luck@intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sasha Levin <sashal@kernel.org>, Jiri Kosina <jkosina@suse.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <5b79d292-7a75-48f4-8303-9ecd5211fe99@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <aJpnStlxDUsGNPuA@agluck-desk3>
 <cad0806b-3a87-4630-b19a-bbe8d9db1701@paulmck-laptop>
 <A7310727-3DAF-4AF0-8E82-6AD17F5E94AC@zytor.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A7310727-3DAF-4AF0-8E82-6AD17F5E94AC@zytor.com>

On Mon, Aug 11, 2025 at 03:45:54PM -0700, H. Peter Anvin wrote:
> On August 11, 2025 3:12:25 PM PDT, "Paul E. McKenney" <paulmck@kernel.org> wrote:
> >On Mon, Aug 11, 2025 at 02:57:30PM -0700, Luck, Tony wrote:
> >> On Mon, Aug 11, 2025 at 02:46:11PM -0700, Paul E. McKenney wrote:
> >> > On Fri, Aug 08, 2025 at 10:31:27AM +0200, Krzysztof Kozlowski wrote:
> >> > > On 05/08/2025 19:50, Sasha Levin wrote:
> >> > > With AI you do not have to even write it. It will hallucinate, create
> >> > > some sort of C code and you just send it. No need to compile it even!
> >> > 
> >> > Completely agreed, and furthermore, depending on how that AI was
> >> > trained, those using that AI's output might have some difficulty meeting
> >> > the requirements of the second portion of clause (a) of Developer's
> >> > Certificate of Origin (DCO) 1.1: "I have the right to submit it under
> >> > the open source license indicated in the file".
> >> 
> >> Should the rules be:
> >> 
> >> 1) No submissions directly from an AI agent. The From: line must
> >> always refer to a human.
> >> 
> >> 2) The human on the From: line takes full responsibilty for the
> >> contents of the patch. If it is garbage, or broken in some way
> >> there's no fall back on the "but AI wrote that bit".
> >
> >Another option is "The AI was trained only on input having a compatible
> >license."  Which, to your point, would to the best of my knowledge cut
> >out all of the popular and easily available AIs.
> >
> >There might well be less restrictive conditions on the AI training data,
> >but I am not qualified to evaluate such conditions, let alone construct
> >them.
> 
> I think we need legal advice on this, but I think this is a *really*
> important issue. It could end up being a very ugly mess otherwise.

Indeed, one of the reasonsss that I am not qualified is that I am
no lawyer.  ;-)

							Thanx, Paul

