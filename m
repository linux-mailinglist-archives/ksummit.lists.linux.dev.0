Return-Path: <ksummit+bounces-1172-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B39F47A6EC5
	for <lists@lfdr.de>; Wed, 20 Sep 2023 00:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B2D62819D8
	for <lists@lfdr.de>; Tue, 19 Sep 2023 22:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5B68462;
	Tue, 19 Sep 2023 22:40:46 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEA833D5
	for <ksummit@lists.linux.dev>; Tue, 19 Sep 2023 22:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8716DC433C7;
	Tue, 19 Sep 2023 22:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695163245;
	bh=xnDqlOXADeIP3n2EEnDz4nmR1VwWY9mYcBY2m03/Y6I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qkpbWYgEGCcxWSwHTGooNVXEOR6ZsmbBaARxjjVByyFNKCWC2INusp3+qB8A/WUjT
	 FxcW3jq/4AeCrCpBoBHTe2eJZFqrm/HAZhqIqStDoYjKkNtOei8v6qnjMhC4q/SDo0
	 jzqDe/yoR9DgWUIpLafUQRniXCuZu5nwUGnGf+RQJTZ5jXvA+EnSZLJglk16ND9H92
	 rQWhxE6ESJpiz+28KdTg9Lym8vLbz0jXDovmMmJJFssF/O76OxjV7OvqDvNKwxkBe/
	 XLtDfUN/70DryE4s1e6LjWnNrgWUzTUZAEDyYXN/UVsxAxi/s7cRXlC99lleS6v44b
	 uKyCvW7wCh2hw==
Message-ID: <4e4f9347-8974-143b-cfbf-fd4c7165910e@kernel.org>
Date: Tue, 19 Sep 2023 16:40:44 -0600
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Tech-board-discuss] [MAINTAINERS SUMMIT] Maintainers Support
 Group
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, Theodore Ts'o <tytso@mit.edu>
Cc: tech-board-discuss@lists.linux-foundation.org, ksummit@lists.linux.dev,
 shuah <shuah@kernel.org>
References: <20230919121001.7bc610d4@gandalf.local.home>
 <371cb5d1-9997-a03b-4848-550ac8658021@kernel.org> <ZQoG71Vdy9iLAcY1@mit.edu>
 <ZQoaUy34siNzH1ir@mit.edu>
 <40750d00-723d-4d6b-a936-dbe8e22889e7@infradead.org>
From: Shuah <shuah@kernel.org>
In-Reply-To: <40750d00-723d-4d6b-a936-dbe8e22889e7@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/23 16:07, Randy Dunlap wrote:
> 
> 
> On 9/19/23 15:01, Theodore Ts'o wrote:
>> On Tue, Sep 19, 2023 at 04:39:11PM -0400, Theodore Ts'o wrote:
>>> On Tue, Sep 19, 2023 at 10:52:40AM -0600, Shuah wrote:
>>>> As a member of the CoC, I respectfully disagree with the statement "but all the
>>>> focus has mainly been around telling maintainers how to behave." This impression
>>>> might have been the result of one unfortunate incident that took place last year.
>>>> is only part of what CoC has been doing.
>>>>
>>>> A majority of reports are related to incorrect understanding of how the community
>>>> works and discusses technical issues. Most of them get resolved without involving
>>>> the community. This is behind the scenes silent work CoC does.
>>>>
>>>> It is unfortunate that CoC is being viewed as a body that is focused on telling
>>>> maintainers how to behave. I would encourage to not view CoC work based on one
>>>> or two cases that were outliers. CoC worked very hard to resolve them fairly and
>>>> that benefited the community as a whole.
>>>
>>> Shuah, I don't think this is the fault of the CoC.  Much of it is in
>>> how people interpret the CoC, or think it should be adapted.
>>
>> I just realized that this statement was a bit ambiguous; in the first
>> CoC, I meant the "Code of Conduct Committee".  In the second CoC in
>> this sentence, I made the "Code of Conduct".
>>
>>  From the context of what you wrote, I *think* you were consistently
>> referring to the Code of Conduct Committee, but when I see CoC I tend
>> think the actual "Code of Conduct" and not the committee which
>> enforces the CoC.
>>
>> Apologies for any confusion,
> 
> Thanks for explaining. I was confused by Shuah's comments (but I
> came to the same conclusion that you did).
> 

Thanks for explaining. Either way CoC by itself is merely a document
and it falls on the CoC committee to field the reports. I am glad we
are having this discussion to clarify CoC and how CoC committee acts
on the reports.

With all of the confusion surrounding CoC and how it gets interpreted,
it is a good idea to revisit and adapt to make it clear the what our
CoC (documented) means and how it guides the CoC committee.

thanks,
-- Shuah

