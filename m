Return-Path: <ksummit+bounces-2120-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2B5B218EF
	for <lists@lfdr.de>; Tue, 12 Aug 2025 01:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0531F1A21589
	for <lists@lfdr.de>; Mon, 11 Aug 2025 23:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD6722F76E;
	Mon, 11 Aug 2025 23:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Km5HrLgn"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62582153C1
	for <ksummit@lists.linux.dev>; Mon, 11 Aug 2025 23:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754953417; cv=none; b=UxbujGrLy6tHq6USTl3Dl2hSUSXm3mKqwsBx8mFIdFko9OUu00Hut5MxKjFwIr6teM5eg/Qcrls4BHnmRCNMsjFabbDgfi09xkF8C4bFJNkfyMX2H16qS2ZorTFjAlIL5d4UOqOGnRvs2Hr3etJetFHJDXxR6R2iNbQGu0NlRu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754953417; c=relaxed/simple;
	bh=yKMj5wyV6/sQk1RaIyaBwN0m86Mc8KMugOvys47FmvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZgjKATD3xwhI4qxCJZp6Swv0hKS58UURO0VLg5gYpExFhPuliQde69pF16IbqxFiuNQ54+dNBIj5wmEiaU4k5XyjI8kBCv8JCJroOa6RzL9IwFZ08MJ+XcGZlUxrNXqHnYy/fdlw+LXKwZybcKGrKtTnnOaDf1YP49GWyxJLpKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Km5HrLgn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41DC4C4CEED;
	Mon, 11 Aug 2025 23:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754953415;
	bh=yKMj5wyV6/sQk1RaIyaBwN0m86Mc8KMugOvys47FmvY=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Km5HrLgnkEpN2e4vpmx1A0bPazPF7J/ylz46UJvBwqngD3dwzAuWibPs7VzoRuGJD
	 u3Qna3AHvPkDz6QpkGsyKsenVuq19uHl86IFJdIJS6mFZ+a7YrfbMuB+Y3GXb/XEdi
	 gzv6E0ZvaeZw9o9+l3HpwNZbb/8GF2tFdrOYzGuggFbh65rSm7jLR93Ee3b1bgFei/
	 txo+E+VRcfRgnW6Iz30d2U28Zm6n6AF7Xm9yBnIBOQaP0c9DbnfEiA0d0/9R4393NP
	 36DoRIBj42h2sLg24phFmmeSRWKbsgcpz/jdRY1M19/kvw9k2jTdHBwYRjrwXwEfyg
	 Sk1PdS/F22Fkg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id CD0CBCE0965; Mon, 11 Aug 2025 16:03:34 -0700 (PDT)
Date: Mon, 11 Aug 2025 16:03:34 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: "Luck, Tony" <tony.luck@intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sasha Levin <sashal@kernel.org>, Jiri Kosina <jkosina@suse.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <042b0357-3d0f-4451-85f3-631753343a8a@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <aJpnStlxDUsGNPuA@agluck-desk3>
 <cad0806b-3a87-4630-b19a-bbe8d9db1701@paulmck-laptop>
 <87o6slbhap.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6slbhap.fsf@trenco.lwn.net>

On Mon, Aug 11, 2025 at 04:54:38PM -0600, Jonathan Corbet wrote:
> "Paul E. McKenney" <paulmck@kernel.org> writes:
> 
> > Another option is "The AI was trained only on input having a compatible
> > license."  Which, to your point, would to the best of my knowledge cut
> > out all of the popular and easily available AIs.
> 
> That option, of course, opens a separate barrel of worms: if we are
> relying on the system having been trained only on compatibly licensed
> material, then our ability to distribute the result depends on our
> complying with the relevant licenses, right?  Including little details
> like preserving copyright notices...?
> 
> Somehow, I don't really think that this option brings us much joy.

All fair points!

At the same time, I freely confess that I am not yet seeing an option
that brings us much joy, at least for values of "joy" that include actual
incorporation of AI/ML source-code output into the Linux kernel.

							Thanx, Paul

