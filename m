Return-Path: <ksummit+bounces-2060-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EEFB1B9C0
	for <lists@lfdr.de>; Tue,  5 Aug 2025 20:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7001962130A
	for <lists@lfdr.de>; Tue,  5 Aug 2025 18:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155E5218AB0;
	Tue,  5 Aug 2025 18:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="psXfS1bX"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943CFE55A
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 18:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754416877; cv=none; b=AdnXUw3kJfVd6Ijv8PWUCz8KuTMdLqKnNgupqg3svjR0Rzl9/BHPD2oU9bWHqouJROFJiHzNl8g3uPFKbAQcVirVTM/9pZpW93CCdr+Ylq2c658B3Sjmj+PEu77SN+5tiL8qUy4FXGsBl8G0de1eEd7ILAEODi2u4py22xAVC6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754416877; c=relaxed/simple;
	bh=WQ59Q//gTbXqhkh+MIYUxhv6LNYEjow17oASEVC/PWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Om1tqj4D2mwxoQFsRivhYKTyHJEF/szr+wXgBRWN1wHim4KiuhZrhqA+dO6QH0ipTQMtGCwMdw5rswC+/SGzc+e0zGiQG1+mGSBsFmvCHpqVcz67tNUToHhbsCtyCyWp7iwXHkmgcWb4xIGGPLz929AfUjj6W0jxfneRoN5rUAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=psXfS1bX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82CBC4CEF6;
	Tue,  5 Aug 2025 18:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754416876;
	bh=WQ59Q//gTbXqhkh+MIYUxhv6LNYEjow17oASEVC/PWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=psXfS1bX4Tw96Thkbrtg7LetCL4Efxnd0Zb6rUNsu5dNUZYFwQDYgxl1LoFUvI2j2
	 aw4M2QF847h+4dMbSk51whL8ZDTDJu8aqNCK/8ZyAGmN/m8uXZkMqpQIZys6Ai1FRN
	 HCYJg0qpJ+3eFSpjXhdnzyQoMA96bw+BHSKvIbTJ1BxRMrWLVflVPF5zq99fvjC4Wb
	 Pf4PS+OOEHvurS3BQdYpm5w2DTKcBpFf+/c+i7OQ+82Z4LgtpMVfVDL0CyEmkMSczt
	 THJ92d28yEb9xjk9xhQbSCWSnjvQfIFdhlXpUW36AOYrUynrcCbJzmOgQQ1BCIvCvE
	 lg4WxpwFjwBqQ==
Date: Tue, 5 Aug 2025 14:01:14 -0400
From: Sasha Levin <sashal@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The amount of -stable emails
Message-ID: <aJJG6ipsXIGXA6-p@lappy>
References: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz>
 <cb91ddf05b9ea48056765a9027ff9132e080df30.camel@HansenPartnership.com>
 <aJI-wBgmE8LoTyyZ@lappy>
 <cd9ecc4e0913ff9e012cf3c1f07c5920742eac24.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd9ecc4e0913ff9e012cf3c1f07c5920742eac24.camel@HansenPartnership.com>

On Tue, Aug 05, 2025 at 01:33:39PM -0400, James Bottomley wrote:
>On Tue, 2025-08-05 at 13:26 -0400, Sasha Levin wrote:
>> On Tue, Aug 05, 2025 at 12:49:02PM -0400, James Bottomley wrote:
>[...]
>> > Actually, if stable emails just had a header tag, it would be easy
>> > for procmail to sort them out ... which is what I've been asking
>> > for for years.  X-Stable-Base: and X-Stable: seem to be reasonably
>> > common and catch most of it, but codifying the use in the kernel
>> > documentation and using them consistently would really help.
>>
>> Do we have any stable-related mails that don't have an X-Stable:
>> header?
>
>It seems to be mostly working for now, but what I often find is the
>header changes on a whim and the filter stops working.  And, since
>nothing is written down, we all have to guess again what it means.  If
>you're confident this one's not going to change, why not document it
>and commit to using it in the stable process docs?

It will probably need to be bigger than that: we'd need to document the
overall expectations and process before we document some of the nits in
it.

-- 
Thanks,
Sasha

