Return-Path: <ksummit+bounces-2114-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1DAB217F9
	for <lists@lfdr.de>; Tue, 12 Aug 2025 00:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DACD57B1DAD
	for <lists@lfdr.de>; Mon, 11 Aug 2025 22:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F03252D9EEA;
	Mon, 11 Aug 2025 22:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJ6LlByZ"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691692D876D
	for <ksummit@lists.linux.dev>; Mon, 11 Aug 2025 22:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754950346; cv=none; b=oVFyu8yTAsuBn+RLiUqJU23VL3fbIGWh+i5vsl7+CjxFrusnkJ5ozg9a2u0JnxZ/9iceccokkoFC+uRONEcsNORvd57GuhJIGO8mGk70Y/rxb7iP0syi/k1jugc5ZfHNeekGwob0BiZXpa+tkDIRoBzhofxlPWihCNCGhjd5bx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754950346; c=relaxed/simple;
	bh=25OG5fudMm2NyH0v4AoWK3A1+rPXU1wGselN9dykQu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8OxNWBOayLQkgKMo4R1qusVI3prqjvnhd19kY8bq1mO3W8WEDYt/HL05zfE4k10S8jamAuY+bFcfTM3KM5sU8Zz5XhjcH/GTwfaAW/KkeQvm66IIRnGDewg3TT6fBUREwO22gXoP+QmMDRFu02SyBnyRRRoNRvA/XT3ErpVlLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJ6LlByZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01E5C4CEED;
	Mon, 11 Aug 2025 22:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754950345;
	bh=25OG5fudMm2NyH0v4AoWK3A1+rPXU1wGselN9dykQu8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=eJ6LlByZ4rYvgb9HXXqPA8iZgOtXqBPgG8+DYOKGWokBqeUWXazd84pLB1oQtD7S0
	 7XnqR7Mcea0Pru0OQe6+jx02e+8Amk2uhs6Bl+sAJuTpedB5xvnXSt4IKzcw2YjCPe
	 UnJNDBz23ZuxjWX4JuW8MQLZ9xmzbkmNwfIRyFdGmjP2/7F+2fBPsIrhUheOQpgE5y
	 Z4Gz1VaX/YWWfq8tHgNoW+FBe+qvV/cP7G9gmChmDCqVABf9zNtq+HbFb1W9QMft1f
	 HyYZW+DYX9sOpHY4S+YnwX1nZ5jVrJH5jrBCPaPXfEQ4AzsATJv2m1oNXQ95aiONZn
	 wQvEFB7T5oeFg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 6B3D9CE0965; Mon, 11 Aug 2025 15:12:25 -0700 (PDT)
Date: Mon, 11 Aug 2025 15:12:25 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
	Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <cad0806b-3a87-4630-b19a-bbe8d9db1701@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <aJpnStlxDUsGNPuA@agluck-desk3>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJpnStlxDUsGNPuA@agluck-desk3>

On Mon, Aug 11, 2025 at 02:57:30PM -0700, Luck, Tony wrote:
> On Mon, Aug 11, 2025 at 02:46:11PM -0700, Paul E. McKenney wrote:
> > On Fri, Aug 08, 2025 at 10:31:27AM +0200, Krzysztof Kozlowski wrote:
> > > On 05/08/2025 19:50, Sasha Levin wrote:
> > > With AI you do not have to even write it. It will hallucinate, create
> > > some sort of C code and you just send it. No need to compile it even!
> > 
> > Completely agreed, and furthermore, depending on how that AI was
> > trained, those using that AI's output might have some difficulty meeting
> > the requirements of the second portion of clause (a) of Developer's
> > Certificate of Origin (DCO) 1.1: "I have the right to submit it under
> > the open source license indicated in the file".
> 
> Should the rules be:
> 
> 1) No submissions directly from an AI agent. The From: line must
> always refer to a human.
> 
> 2) The human on the From: line takes full responsibilty for the
> contents of the patch. If it is garbage, or broken in some way
> there's no fall back on the "but AI wrote that bit".

Another option is "The AI was trained only on input having a compatible
license."  Which, to your point, would to the best of my knowledge cut
out all of the popular and easily available AIs.

There might well be less restrictive conditions on the AI training data,
but I am not qualified to evaluate such conditions, let alone construct
them.

							Thanx, Paul

