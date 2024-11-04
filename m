Return-Path: <ksummit+bounces-1672-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AF49BB2BA
	for <lists@lfdr.de>; Mon,  4 Nov 2024 12:15:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6DEE1C2017B
	for <lists@lfdr.de>; Mon,  4 Nov 2024 11:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A041CC166;
	Mon,  4 Nov 2024 11:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l4+Xl87n"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0924B1CBA17;
	Mon,  4 Nov 2024 11:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730718078; cv=none; b=lwty5NwT+u8f+DcoZPRy4FsfOavauD8zfXP+FPkBYof9vI96Vor4Nin5v6NJyncl4cLUcIz+Mwtrs5z6TAhvDRniCX/iVx6EpBD5qHA2Ls0R8xA2qtFOat1ygmm8C04L8xZxmzY4ddGZDwjmVuOWasWzomfdjVdjBu9uvYbbC6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730718078; c=relaxed/simple;
	bh=InLkB2MYSWERbYRy5Zs78I/f+NsxdGB1dKTMdljGdTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdGvZnpiJYkJh3A4ixWGgZek//vX9sqoN6q/GbAW/UM8aZWeHZX3JcdmcjoZC/+WrSX0RNggrkqA3U/JHHv5+2S9Y5JTNv+uSn7+YAmmCPwzIltJ+T7M6aKazrgqTpvXwt051HY34l2FHlDaFh6karEVDy1zIMIdr27PAv9AL20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l4+Xl87n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FFA1C4CECE;
	Mon,  4 Nov 2024 11:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730718077;
	bh=InLkB2MYSWERbYRy5Zs78I/f+NsxdGB1dKTMdljGdTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l4+Xl87n99a+En+xoQJw/hS9w8A86ATtprwIGfI81lwPumVbhvCX/jbHsDL5EyPWP
	 C0XPMQRdXNWEbHLWpMSTH9BOwKV3vFCMR18DXPVGjCJeZE0r45z63K8xMPjC/n0Y94
	 3ZdkAeAttzANk6U7HK8QfYnyGrQYF0hhGEoZn+XL4uU6rwwvOuW57bIQ4MA0shOq5w
	 6DvfSVKz3VJHdlD7WKMo9CSv3MnsWdX/Im8m384tOsA6lWR+B2jdb9hJQZWe7/jRoB
	 d0d5nBiheYyV6WjHbgrnAAUqClBHNdXJH8SVRyLI+pMT6dAYbGq75/qDohpnZadUVD
	 UroN52GM2PRtQ==
Date: Mon, 4 Nov 2024 06:01:15 -0500
From: Sasha Levin <sashal@kernel.org>
To: Joel Granados <joel.granados@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, Kees Cook <kees@kernel.org>,
	torvalds@linux-foundation.org, ksummit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: Re: linus-next: improving functional testing for to-be-merged
 pull requests
Message-ID: <ZyipewUEwqrQ-z9b@sashalap>
References: <ZxZ8MStt4e8JXeJb@sashalap>
 <792F4759-EA33-48B8-9AD0-FA14FA69E86E@kernel.org>
 <ZxdKwtTd7LvpieLK@infradead.org>
 <ZyAUO0b3z_f_kVnj@sashalap>
 <z2zehszaude6q2jicvdkjz7bgr22zxxayw5vgbjrhgoghqxhia@ngjos2ihibjo>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <z2zehszaude6q2jicvdkjz7bgr22zxxayw5vgbjrhgoghqxhia@ngjos2ihibjo>

On Mon, Nov 04, 2024 at 09:49:15AM +0100, Joel Granados wrote:
>On Mon, Oct 28, 2024 at 06:46:19PM -0400, Sasha Levin wrote:
>> On Mon, Oct 21, 2024 at 11:48:34PM -0700, Christoph Hellwig wrote:
>> >On Mon, Oct 21, 2024 at 09:54:53PM -0700, Kees Cook wrote:
>> >> For example, for a given PR, the bot can report:
>> >>
>> >> - Were the patches CCed to a mailing list?
>> >> - A histogram of how long the patches were in next (to show bake times)
>> >> - Are any patches associated with test failures? (0day and many other
>> >> CIs are already running tests against -next; parse those reports)
>> >>
>> >> We could have a real pre-submit checker! :)
>> >
>> >That would be very useful.  Items 1 and 2 should be trivial, 3 would
>> >require a bit of work but would still be very useful.
>>
>> If you've been following so far, there is a bot that is capable of doing
>> most of the above
>> (https://git.kernel.org/pub/scm/linux/kernel/git/sashal/next-analysis.git/).
>>
>> Here's a histogram that describes v6.12-rc4..v6.12-rc5 as far as how
>> long commits spent in -next:
>>
>> Days in linux-next:
>> ----------------------------------------
>>   0 | +++++++++++++++++++++++++++++++++++++++++++++++++ (89)
>> <1 | +++++++++++ (21)
>>   1 | +++++++++++ (21)
>>   2 | +++++++++++++++++++++++++ (45)
>>   3 | ++++++++++++++ (25)
>>   4 | +++++ (10)
>>   5 |
>>   6 | + (2)
>>   7 |
>>   8 | + (3)
>>   9 | ++ (4)
>> 10 |
>> 11 | +++ (6)
>> 12 |
>> 13 |
>> 14+| ++++++++ (15)
>This looks super nice. Sometimes I need to answer how long a
>commit/series has been in next to either take it out of the PR or to at
>least have a comment to Linus.
>I see that I can use the script like `histo.sh /PATH/TO/DB COMMIT-ID`,
>which is exactly what I would expect.

Thanks!

>Is the idea to run the scripts from
>https://git.kernel.org/pub/scm/linux/kernel/git/sashal/next-analysis.git
>or to populate ones own DB in linux-next and then run histo?

You can use the DB in the git repo, but prep.sh is provided in case you
want to create your own or if I stop updating the repo for some reason.

-- 
Thanks,
Sasha

