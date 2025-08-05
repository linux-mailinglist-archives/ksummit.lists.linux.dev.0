Return-Path: <ksummit+bounces-2047-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8764B1B90F
	for <lists@lfdr.de>; Tue,  5 Aug 2025 19:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A40A318A7513
	for <lists@lfdr.de>; Tue,  5 Aug 2025 17:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56CDB292B5E;
	Tue,  5 Aug 2025 17:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p6Vtw/US"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CFC2AD14
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 17:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754414066; cv=none; b=qyz2iONxuYfhOQcCS1Uf/mspB8GvIxbQvM/I0VUZnw2DvVGO9R8uOL72pQDxDCHVEqnaX/ZfNZE1te8Hw1tE7rxxB5qiIIn9/bnZBj0mYc4L17Otahj5kHiA8f6De/4+C86XPqaXzJyIyR/wOmFH01JTn4RVh8UGWnvV6q2m43I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754414066; c=relaxed/simple;
	bh=OpCTm7yCZjSwLrSyO79h8LePiScmbSyCDZh0nYybp58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAIcecaBdlmog6yRzv5GxSTdwApKKJvdQCNyumkHZ9WrcX0vyU4YOhdhU/BjeXpwQ5kCXKzreYSExldAy+j3qg6GKIWNMSxHf3CpQdEDli0gteT4pe6l+4GilcYVpoheGR4oK2qkboMOQItmduZIRPNJEQIRLFEFqczrcy7z9mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p6Vtw/US; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0239FC4CEF0;
	Tue,  5 Aug 2025 17:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754414066;
	bh=OpCTm7yCZjSwLrSyO79h8LePiScmbSyCDZh0nYybp58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p6Vtw/USIfhtTn3zhYBFQOrNJ2NS/F424PbcvZ+4vSmompdoBy1jLcmzTbG24yoyc
	 kS7EAlUaUsMvhCgDbijcG0RA5bcyLm6HPAM+MmgaM+TbFajb00W+Q1hhUvI9cfaD6/
	 I6qGO9g3bo8XY+Blak6WYln3alMYHATXJpiWco0kUXVMXYWE0WeHvicApji9En67YF
	 O5os05NV1ydcBweAtL2oTBWRSSRFP9xdDdYTMxUHEsXnMdOaeHTrAOw3/DYoZWSWuZ
	 Sh3Vnf58XLcqMW7Cd/p8UryPKct/iTtyifHlO8ymWSopRINjIxRfX8LmWRjSzRr3vP
	 j+3yG314Pkvqg==
Date: Tue, 5 Aug 2025 13:14:24 -0400
From: Sasha Levin <sashal@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Mark Brown <broonie@kernel.org>, Jiri Kosina <jkosina@suse.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The amount of -stable emails
Message-ID: <aJI78KDWGq35K6W-@lappy>
References: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz>
 <9dbe8a42-e43a-4beb-acfa-3ed1c069fa47@sirena.org.uk>
 <20250805122828.68312a8d@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250805122828.68312a8d@gandalf.local.home>

On Tue, Aug 05, 2025 at 12:28:28PM -0400, Steven Rostedt wrote:
>On Tue, 5 Aug 2025 17:08:44 +0100
>Mark Brown <broonie@kernel.org> wrote:

[snip]

>Now, if something is marked for stable, I really don't want to be bothered
>that it made it to a stable tree. If I marked something for stable, sending
>me an email that it was applied is rather redundant.

So I'd love to cancel the "Added to the stable tree" mails. I honestly
don't even know why they go out: my understanding that it was for
historical reasons where someone asked for those in the past, but I
really feel bad about sending those out because to me they are pure
spam.

>> One thing I'd really like to see there would be to avoid sending each
>> patch separately for every stable version, that just blows up the mail
>> volume hugely especially for those of us with subsystems that carry a
>> lot of quirks.  I'm sure the range of versions something is being pulled
>> back to could be expressed in a single mail instead, it's always some
>> range of versions being processed en masse rather than just a single
>> version.  The per version cover letter is more useful for replying with
>> test results but that doesn't need the whole series.
>
>Yes, I agree that a digest of all the autoselects would be good.

I actually did that earlier today!

See the latest batch of AUTOSELs: https://lore.kernel.org/stable/20250805130945.471732-1-sashal@kernel.org/T/#t

Instead of one mail per tree, the subject line contains the range of
trees it applies to.

-- 
Thanks,
Sasha

