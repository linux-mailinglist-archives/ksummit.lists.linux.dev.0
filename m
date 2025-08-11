Return-Path: <ksummit+bounces-2115-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 884FFB21856
	for <lists@lfdr.de>; Tue, 12 Aug 2025 00:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8E041A22356
	for <lists@lfdr.de>; Mon, 11 Aug 2025 22:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786062E2F03;
	Mon, 11 Aug 2025 22:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pBJWVqsr"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41451C1AB4
	for <ksummit@lists.linux.dev>; Mon, 11 Aug 2025 22:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754951336; cv=none; b=rVl8tBCjwHFRBS4ZOkKLH3hILP0tsuo31h1K1fgG+kUnU/LER0aLDatHvqDAq0q3lajT2TgY5S3PTcFtjY2dEJw0wKts3E8LWkI/Wu+8fEMtXPQeu7mm3BdFQ8oOK0dO9UGJi+N6N21+pFbaGgQa+sXjPZYPX9zN2D2F62ypEVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754951336; c=relaxed/simple;
	bh=KiSA1iEh6onYyATpgY22jCLjtKzfHNiJHEOW3qQTbN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lSjex08PO7Q0SJEP2ud+E8fcMdTST1R4y0NnGUUaHdpeW7jKTqjoUpHmkq2YXxYjI9Lo2utHCd+UhbvBKIOqSJ6QfJz8gd2UQ6m6b7A0hH5FyJj7ICAfZ/UWzGklGiXd5jiZGXefMrVugooBZt3z56zT7LH8G5q4bCp6ofuYWpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pBJWVqsr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051FEC4CEED;
	Mon, 11 Aug 2025 22:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754951335;
	bh=KiSA1iEh6onYyATpgY22jCLjtKzfHNiJHEOW3qQTbN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pBJWVqsrHjEwLirj275LVa29L9iEdeDBpv9fpj12isFB5SC2nrmDZmuS11iv0QSM8
	 ezymQA3LqXJELj2tpm+P2XTfPsJHhr6H4rZh0vYCrGQmXLHOdgfbxchZglzHs3+GCW
	 CfL50UWMlTElUu7QW2qo7gUKiP7PQ8ZKG15whOkYPBGeztNEaDSaJYYJpAZeXE6AqT
	 Xw/WSfhK/EKrqC3UYp3idXwMo0C0E+IzI9DIgw0ZU1+2fAFzKyBBAsB5H8vPQmehB1
	 bE2rpTaTGmgTIZVqTFWpqWLzFYCM2RhTlImsXWYgvEFq4nqgOA5IDLzdoEcGxQ5yA+
	 GAvv/MIXD359A==
Date: Mon, 11 Aug 2025 18:28:52 -0400
From: Sasha Levin <sashal@kernel.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <aJpupN1KztXyglnN@lappy>
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
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aJpnStlxDUsGNPuA@agluck-desk3>

On Mon, Aug 11, 2025 at 02:57:30PM -0700, Luck, Tony wrote:
>On Mon, Aug 11, 2025 at 02:46:11PM -0700, Paul E. McKenney wrote:
>> On Fri, Aug 08, 2025 at 10:31:27AM +0200, Krzysztof Kozlowski wrote:
>> > On 05/08/2025 19:50, Sasha Levin wrote:
>> > With AI you do not have to even write it. It will hallucinate, create
>> > some sort of C code and you just send it. No need to compile it even!
>>
>> Completely agreed, and furthermore, depending on how that AI was
>> trained, those using that AI's output might have some difficulty meeting
>> the requirements of the second portion of clause (a) of Developer's
>> Certificate of Origin (DCO) 1.1: "I have the right to submit it under
>> the open source license indicated in the file".
>
>Should the rules be:
>
>1) No submissions directly from an AI agent. The From: line must
>always refer to a human.

We already require that, no?

We have the following in our docs:

         code from contributors without a known identity or anonymous
         contributors will not be accepted. All contributors are required
         to "sign off" on their code

Which requires a real, known, human identity behind the "Signed-off-by"
tag.

I don't think anyone here interperted it differently, but we can maybe
ask the LF legal folks if that's the case (and help us improve it) if
you think that this interpertation is not clear.

>2) The human on the From: line takes full responsibilty for the
>contents of the patch. If it is garbage, or broken in some way
>there's no fall back on the "but AI wrote that bit".

So right now the bigger issue the community has faced from this aspect
is mindless checkpatch/syzbot/etc "fixes".

We already have extensive requirements in the docs that often just get
ignored. Look at submit-checklist.rst, authors must:

1. Test with multiple debug configs.
2. Exercise all code paths with lockdep
3. Test with fault injection.
4. Verify build against linux-next.
5. Code builds cleanly with no warnings.
6. Passes all[yes,no,mod]config builds.
7. Builds on multiple CPU archs.
8. Follows coding style.
9. Keeps checkpatch.pl happy.
10. Checked with sparse.
11. Justifies any violations.

-- 
Thanks,
Sasha

