Return-Path: <ksummit+bounces-981-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7F677D18A
	for <lists@lfdr.de>; Tue, 15 Aug 2023 20:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB6E02815A0
	for <lists@lfdr.de>; Tue, 15 Aug 2023 18:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6931317AB4;
	Tue, 15 Aug 2023 18:10:44 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA9B15AF9
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 18:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C93CC433C9;
	Tue, 15 Aug 2023 18:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692123042;
	bh=n8MJh2M/1bDU9CfOsVMFUv0JriMk1Vl0JAooaRlYtR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R0LVLaROD1Nu04uF8xC3MoRqsExzOhsgsQH3lYuJfQgViQwTMj6O0+Y7XKgYCtRxs
	 LDZv96J3pzRn8521ogB2fDMyN3kqkv0aM7sUPUMh+/NDenRz/EUoV26x3/pDxPgd79
	 p6QRnIC9F0WlnzwGiW/cfCOEEaFyjiXtcwTyAyhjIEg82hhCQJOvnQiRK7FN3ohc9o
	 jxPdDuuD6wfD1Z9HOapexAi6b7LyjO2anqFfTN+QHe1z1YjLHwzSP6LIeB7pZb7r5e
	 Arz2oV8LXsj6wcfbHPtU7I+VUoaJmZeO1fRMRMwxEOblwIKAeof1hQInF5qUlLXhFr
	 ouzfmb9tj//+Q==
Date: Tue, 15 Aug 2023 14:10:40 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Quality standards for embargoed code
Message-ID: <ZNu/oDTPj3LNyp+M@sashalap>
References: <ZNuuvS5BtmjcazIv@sashalap>
 <10adba69-f937-4d22-a57d-b392ad87be64@sirena.org.uk>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <10adba69-f937-4d22-a57d-b392ad87be64@sirena.org.uk>

On Tue, Aug 15, 2023 at 06:18:16PM +0100, Mark Brown wrote:
>On Tue, Aug 15, 2023 at 12:58:37PM -0400, Sasha Levin wrote:
>
>> 1. Ask (require) organizations that repeatedly go through this mechanism
>> to create a test environment that can demonstrate how the embargoed code
>> passes different build/validation tests. We should set a minimal bar to
>> the demonstrated quality of code that we'll "sneak" behind the backs of
>> community members.
>
>This would be great, it's especially frustrating when the issues people
>find are readily visible either in build testing or with virtual
>environments and therefore even if people want to keep things secret
>they should be able to do the testing themselves.  I'm not sure what the
>consequences would be for messing up other than a bit of yelling but
>perhaps that's enough.

My thinking was that the community could define a set of requirements
that we expect to be tested before we're willing to let code sneak in,
something along the lines of:

1. Built with GCC v1, v2, v3 for platforms x86, arm64, ... using
allmodconfig/allyesconfig/allnoconfig/...

2. Built with Clang v1, v2, v3 for platforms x86, arm64, ... using
allmodconfig/allyesconfig/allnoconfig/...

3. Run through LTP released in the past month.

4. Custom community provided tests, etc...

The consequence of letting something sneak through will then be on us,
and will probably trigger the addition of a test to the list of tests
above.

-- 
Thanks,
Sasha

