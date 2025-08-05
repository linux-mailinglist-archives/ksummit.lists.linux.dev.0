Return-Path: <ksummit+bounces-2050-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45711B1B957
	for <lists@lfdr.de>; Tue,  5 Aug 2025 19:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75BBD18107D
	for <lists@lfdr.de>; Tue,  5 Aug 2025 17:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCC3293C4D;
	Tue,  5 Aug 2025 17:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IC2lhqAI"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1DF3FBB3
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 17:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754414786; cv=none; b=VYP/W+KPU1kuuK6RoWXd/M0IamSQGcT7FIXtAzRprFFXnJr7RpDCAPZOqQCHjaCrw9h7KAdioBtNmRoBS7JpGbW8Y9ixsHLz6cHziENS0rh5oH2cQL1EiDEKlCYDxVex0r3XJzRGfRyp1eLaIE3enHU98OYidbG1X14v8q4tJPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754414786; c=relaxed/simple;
	bh=9u5cGk2zftVLSXbWVCzOjGCV1NhvAVHy7QjQqnITSfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jSjTKPgOKdcmKd2q9P/hcCKXiKWxQV77OWfkGR0hDaQNBmYxSNsnZoYd92lms+bAgkdF7jAmaEhbIPp3I2O9L6x4yV6+4MTci3UbNhiGG4xWeQ2a6vfX29S4d5YuvU7zuCbNCOrPREkiX1GUmCfxFh78M8ai/Fhp04xe5HXVQzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IC2lhqAI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17F30C4CEF0;
	Tue,  5 Aug 2025 17:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754414786;
	bh=9u5cGk2zftVLSXbWVCzOjGCV1NhvAVHy7QjQqnITSfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IC2lhqAIl17cx5lC6ZgVoEc6cGC8AlbZ++2zCt9hpSI6a16YJ0kwPwzffWBo1hYRw
	 F7LwJ1q2s0p8XiPjnG861LZZVI1ckor81V97yndOsDS2u7f5tKzILImSIEKVThOYus
	 AR+Av0hES/HNhnQmqTGrucnj5sPmQoq1YPgKRPytTTpF9HBxiUuJci+44bcNve9KhI
	 5mZFCC0mT2jHWcpnh1abHmiXhhANWmMOmduAWACSbGfnsIWBYc2xSZVK1G0edd4JuJ
	 Wf2U4WmShwLnthhubE+YXAyp47SJqaWcoVZpKZdELcRsSMh3bIn1Lbcz9pOqWGJZaF
	 xAO1hGDHIpMEA==
Date: Tue, 5 Aug 2025 13:26:24 -0400
From: Sasha Levin <sashal@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The amount of -stable emails
Message-ID: <aJI-wBgmE8LoTyyZ@lappy>
References: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz>
 <cb91ddf05b9ea48056765a9027ff9132e080df30.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <cb91ddf05b9ea48056765a9027ff9132e080df30.camel@HansenPartnership.com>

On Tue, Aug 05, 2025 at 12:49:02PM -0400, James Bottomley wrote:
>On Tue, 2025-08-05 at 17:38 +0200, Jiri Kosina wrote:
>> This proposal is coming as a followup to the brief IRC discussion
>> that happened a few months back.
>>
>> The amount of e-mails that are coming (with maintainers directly
>> CCed) as a result of patches being merged to -stable is so
>> overwhelming that I am not sure that people are making any productive
>> use of it whatsoever.
>>
>> I am personally pretty much ignoring most of it, as (a) I wouldn't
>> have time to do anything else otherwise (b) I don't have a sufficient
>> motivation / time to invest effort into stable in the fist place.
>>
>> I feel it'd be beneficial to discuss this, and (depending on the
>> outcome)perhaps make it opt-in (or opt-out) at least, with
>> people/subsystems  having means how to be excluded from all that ...
>> ?
>
>Actually, if stable emails just had a header tag, it would be easy for
>procmail to sort them out ... which is what I've been asking for for
>years.  X-Stable-Base: and X-Stable: seem to be reasonably common and
>catch most of it, but codifying the use in the kernel documentation and
>using them consistently would really help.

Do we have any stable-related mails that don't have an X-Stable: header?

-- 
Thanks,
Sasha

