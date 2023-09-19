Return-Path: <ksummit+bounces-1170-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7637A6E44
	for <lists@lfdr.de>; Wed, 20 Sep 2023 00:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2AF3281849
	for <lists@lfdr.de>; Tue, 19 Sep 2023 22:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32553AC20;
	Tue, 19 Sep 2023 22:07:31 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1280D37144
	for <ksummit@lists.linux.dev>; Tue, 19 Sep 2023 22:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=/3AakIpvpkU9IBxzQQv+Xfc8huZ6mM2m+caflVfL2DA=; b=LK9WJLDiRfd0y/BPRckK7uWPGr
	5V8KBQTq7lYgKgTQCP98RDI5jpgPcd0WGUCxLFLJMXJ++2f+3SZoSGZdVF/96yt/ZMiAHE2Lr3aoh
	3h1PZ4S2Qu0KA6DWH6cIWmwxik6e2s+WVqARG37TeorS3YGLY1Z7GOQbYT/iJjLZbGm6IiKmObeTD
	SjMhXK6djGrazJ6MmsZaUf/zNR7boxVT58m+EvNIuBrfj7rS/S4eB3W04skTtWFQdpPzH6i2/BWdE
	/ADsJIqEI4PQeqPJC1i3J9V9/IwXRnknAdjGdq8arRkekFBgC9cQ0iLML2KUJuX9X9DvmADXTDarg
	SB9wx/IQ==;
Received: from [2601:1c2:980:9ec0::9fed]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qiisR-001Ldl-2K;
	Tue, 19 Sep 2023 22:07:27 +0000
Message-ID: <40750d00-723d-4d6b-a936-dbe8e22889e7@infradead.org>
Date: Tue, 19 Sep 2023 15:07:27 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Tech-board-discuss] [MAINTAINERS SUMMIT] Maintainers Support
 Group
Content-Language: en-US
To: Theodore Ts'o <tytso@mit.edu>, Shuah <shuah@kernel.org>
Cc: tech-board-discuss@lists.linux-foundation.org, ksummit@lists.linux.dev
References: <20230919121001.7bc610d4@gandalf.local.home>
 <371cb5d1-9997-a03b-4848-550ac8658021@kernel.org> <ZQoG71Vdy9iLAcY1@mit.edu>
 <ZQoaUy34siNzH1ir@mit.edu>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ZQoaUy34siNzH1ir@mit.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/19/23 15:01, Theodore Ts'o wrote:
> On Tue, Sep 19, 2023 at 04:39:11PM -0400, Theodore Ts'o wrote:
>> On Tue, Sep 19, 2023 at 10:52:40AM -0600, Shuah wrote:
>>> As a member of the CoC, I respectfully disagree with the statement "but all the
>>> focus has mainly been around telling maintainers how to behave." This impression
>>> might have been the result of one unfortunate incident that took place last year.
>>> is only part of what CoC has been doing.
>>>
>>> A majority of reports are related to incorrect understanding of how the community
>>> works and discusses technical issues. Most of them get resolved without involving
>>> the community. This is behind the scenes silent work CoC does.
>>>
>>> It is unfortunate that CoC is being viewed as a body that is focused on telling
>>> maintainers how to behave. I would encourage to not view CoC work based on one
>>> or two cases that were outliers. CoC worked very hard to resolve them fairly and
>>> that benefited the community as a whole.
>>
>> Shuah, I don't think this is the fault of the CoC.  Much of it is in
>> how people interpret the CoC, or think it should be adapted.
> 
> I just realized that this statement was a bit ambiguous; in the first
> CoC, I meant the "Code of Conduct Committee".  In the second CoC in
> this sentence, I made the "Code of Conduct".
> 
> From the context of what you wrote, I *think* you were consistently
> referring to the Code of Conduct Committee, but when I see CoC I tend
> think the actual "Code of Conduct" and not the committee which
> enforces the CoC.
> 
> Apologies for any confusion,

Thanks for explaining. I was confused by Shuah's comments (but I
came to the same conclusion that you did).

-- 
~Randy

