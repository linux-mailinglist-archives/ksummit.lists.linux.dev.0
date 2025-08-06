Return-Path: <ksummit+bounces-2098-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 980EBB1C5C1
	for <lists@lfdr.de>; Wed,  6 Aug 2025 14:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09C2818955DE
	for <lists@lfdr.de>; Wed,  6 Aug 2025 12:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4FF28BA84;
	Wed,  6 Aug 2025 12:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jo6p5fqp"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD2D289373
	for <ksummit@lists.linux.dev>; Wed,  6 Aug 2025 12:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754482803; cv=none; b=R07mhdjyqoeRdqpi5NsVJe1y72eqsVniCa4as/pqzt7YtMOZv6OBZ9/DC93ORkBTcvKycvj1fKxjz+qGk9/jQ6q783+gXXCUU6vkK5G+uvru/SMyv3PSNBoCShLwKNt6iLA6waji+QyZA/d5tJTwl0OYYvsMn1bFoSkuDjjQrec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754482803; c=relaxed/simple;
	bh=W1WJ+FbDTUnTfK8IWlfGXPoaCKJ1njhu06qO1KNHi1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hcQc9wdvPKogPxLB8nnXLPeYYotLOt8Lk8Juc7hOao9zqq/JmqkGKguYFPaJLGREy4obG6FBxYqUsl3arK8ikXX9uocSOB4zIbm4OsycbvkTBl6EydFEmdQOVMk9rHqcC9AkfxjUf6AFgzXu0rmwkGFQ6+MKgvIC1YBfCpB8btg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jo6p5fqp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A34BDC4CEE7;
	Wed,  6 Aug 2025 12:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754482802;
	bh=W1WJ+FbDTUnTfK8IWlfGXPoaCKJ1njhu06qO1KNHi1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jo6p5fqpQRHtTDDyIB7oKhVFI++2MWrzxRmRTObcjlrNGlhPPFIpgDzXqmsu0nRE2
	 2Nvt4AiYM6zJkEHML08LIPDdGaYjN8ZrE4Ua2iFoMQ70AQ0wgoSwiE/u5ydLEUDLeq
	 rvF9nS6sTvLu/DaxO5fRGzaICNtXUoZQNAtdoAixYhrVKlMbTryittvYi37K1x/zgL
	 EePWUHlhKxLqKar4zuFPzzkn1puaNyINhuJztLJbEi7BzeRAzn0ixmFJfyRkI2luO+
	 jERCaJly44T6+/lK2V6CK9IWJ0ZGjHzgik4C0bLfB86lSHmPGr8TtoQLId+aKyWIzq
	 XJ4Vm97ESXn3Q==
Date: Wed, 6 Aug 2025 08:20:02 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [MAINTAINERS SUMMIT] The amount of -stable emails
Message-ID: <aJNIckP-3MBG4FFR@lappy>
References: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz>
 <9dbe8a42-e43a-4beb-acfa-3ed1c069fa47@sirena.org.uk>
 <20250805122828.68312a8d@gandalf.local.home>
 <09a8f276-916f-45e9-bd63-ffddecf1be9a@sirena.org.uk>
 <CAMuHMdWapDrTn6Tv=YA+s1kcT8A3TrXu2F35sPcv8RHSJyYWXQ@mail.gmail.com>
 <63d3abec-1c1e-4828-a05a-1348d840ffaf@sirena.org.uk>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <63d3abec-1c1e-4828-a05a-1348d840ffaf@sirena.org.uk>

On Wed, Aug 06, 2025 at 11:42:03AM +0100, Mark Brown wrote:
>On Wed, Aug 06, 2025 at 10:04:11AM +0200, Geert Uytterhoeven wrote:
>> On Tue, 5 Aug 2025 at 18:41, Mark Brown <broonie@kernel.org> wrote:
>> > On Tue, Aug 05, 2025 at 12:28:28PM -0400, Steven Rostedt wrote:
>
>> > > > One thing I'd really like to see there would be to avoid sending each
>> > > > patch separately for every stable version, that just blows up the mail
>> > > > volume hugely especially for those of us with subsystems that carry a
>> > > > lot of quirks.  I'm sure the range of versions something is being pulled
>> > > > back to could be expressed in a single mail instead, it's always some
>> > > > range of versions being processed en masse rather than just a single
>> > > > version.  The per version cover letter is more useful for replying with
>> > > > test results but that doesn't need the whole series.
>
>> > > Yes, I agree that a digest of all the autoselects would be good.
>
>> Commits are not always backported to all stable trees.  Sometimes I
>> receive an email about a backport, and wonder "has that still not
>> been backported?", only to discover it was backported, but not to
>> a very old stable tree.
>
>TBH I think a summary would help there - currently you're looking at six
>threads for all the different stables and have to check every patch in
>each, if we were instead getting a summary that says that patch A has
>been backported to stables X-Y then it'd highlight more clearly if
>something wasn't pulled far enough back.

Something along the lines of
https://lore.kernel.org/all/20250805130945.471732-1-sashal@kernel.org/ ?

-- 
Thanks,
Sasha

