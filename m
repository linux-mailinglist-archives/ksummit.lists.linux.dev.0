Return-Path: <ksummit+bounces-2401-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2630DB5A01A
	for <lists@lfdr.de>; Tue, 16 Sep 2025 20:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 868B91C025AF
	for <lists@lfdr.de>; Tue, 16 Sep 2025 18:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F26280024;
	Tue, 16 Sep 2025 18:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="L4nnglLO"
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1896D32D5A0
	for <ksummit@lists.linux.dev>; Tue, 16 Sep 2025 18:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758046054; cv=none; b=kap7KYfD7PTibcGu1g+hwyDJznfGmuHe1vTLLwY4QahDNk/oxZ5LWhOKPPLyM1nREI1EzY7J4tfhkaKidoPebaAWMz3vo5q5NtnwGYyBdLDH98FxBA/iHrvAAhItOXs0b3yTY+b2UUb5X6w+A5VSgDplH4Meqd56mRf4tC4NqpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758046054; c=relaxed/simple;
	bh=m8pahr9LD4dM2Oir6r3VqARUrQWgvE4SfUWq1ev07xE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SC6tXMHT5BBmVwqjWeXrQBd/J/cxpFuvnWtx3l+GWXhKNAvSzxW5B2ryc4LFMSGLoi4HloFatDMqyTgxFIq2tlRDcknqwN0DPfOfnRDjLnZU45YObCHAPZgFrNVublNTd9SqSXCdkGakxYshUD4Q/BxqMcoSmK1eFiV+cIGUP+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=L4nnglLO; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Pue7hb0Q+a+ymnF5mGuOM6tGvrhoyoHGnzzvMFcYlmM=; b=L4nnglLOrQqwsWk2/evAEh5LFO
	C3F5+Zd+XOMB8R1+nMFvuzAkqTZWDlcYp1lZDSW77pmtdOEuk0tNoXeTzW6DTL2NP+CzigZrHakdG
	4iC8cPCsdTCFQkobF2otGpxd7pLd8piMJCwqStHZYNBJAHXKnGE3BGeAwfvpCarKM8fq7+/i7JXdi
	szoL0P14KWzZwWovsm5MpjohzC+UC0mqph1PlHBxtiJ7ZUNBNyh4DGvkDt1GkR31hwKb6Pei1K9i5
	6dg6e0+rVeks01eE37jz5LwHXszTSMw3gkdYFDKKqZAPrBv1INXSW5DH8MNqmzGA1qwcMZBYIOtrX
	+fAOWhsg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uya5R-00000008iGr-1ce8;
	Tue, 16 Sep 2025 18:07:29 +0000
Message-ID: <e100a666-ea8b-4105-8cae-1bfdd2d1e7e5@infradead.org>
Date: Tue, 16 Sep 2025 11:07:27 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS SUMMIT] re-think of richACLs in AI/LLM era
To: Coly Li <colyli@fnnas.com>, Paul Moore <paul@paul-moore.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jan Kara <jack@suse.cz>,
 ksummit@lists.linux.dev
References: <DC0B4305-C340-42C2-84B5-8C370794EBC2@fnnas.com>
 <ntzpuxiyoqf5a5ldeq4tlc37uy3nw3kojoes5ookdmcrb53ome@xbjcgntijlfl>
 <20250908113934.1a31423a@gandalf.local.home>
 <E5FD7630-3474-4F02-A4F8-A1C11DA7672A@fnnas.com>
 <4f2d4025-9fbf-441d-a51a-0c0d4ba16314@infradead.org>
 <CAHC9VhRyRuBtzwn2LbwxqLvj21LwrwrAZx4N3f7At1HHyNFPCQ@mail.gmail.com>
 <yiqw4rfqbry7s34af72eoemon2qbylc6prouafg7xx3aeo2uwa@tdgyedc43hhp>
 <CAHC9VhR0RU+AfhJEZnA2=7CSZhWYTMB5CdbE9BfGoTbYBP9Rnw@mail.gmail.com>
 <s5e5xf2f4svjc6wd6rn6t2h3nxt2egrn63zqx7tfe4ch3rhuc7@vganh63433hd>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <s5e5xf2f4svjc6wd6rn6t2h3nxt2egrn63zqx7tfe4ch3rhuc7@vganh63433hd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Coly,

On 9/16/25 10:12 AM, Coly Li wrote:
> On Wed, Sep 10, 2025 at 03:11:55PM +0800, Paul Moore wrote:
>> On Wed, Sep 10, 2025 at 9:32 AM Coly Li <colyli@fnnas.com> wrote:
>>> On Mon, Sep 08, 2025 at 09:03:24PM +0800, Paul Moore wrote:
>>
>> ...
>>
>>>> I can't say I'm familiar with the RichACL concept, but generally
>>>> speaking yes, the LSM framework exists as a way to implement access
>>>> control mechanisms beyond the traditional Linux access controls (other
>>>> things too, but those aren't really relevant here).
>>>
>>> Is it convenient for normal users or non-root processes (including the policy agent) to
>>> setup the LSM rules? We need to allow normal users to set their own access control policy
>>> for the data they owned.
>>
>> Management of an individual LSM's configuration is generally left to
>> the individual LSM.  Some LSMs restrict their configuration knobs
>> behind capabilities or their own access controls, while others allow
>> unprivileged access to the configuration; it depends on the LSM's
>> security model.  As an unprivileged example, Landlock allows
>> applications, run by arbitrary users, to set their own Landlock
>> security policy via the Landlock API.
>>
> 
> I forward the suggestion to our application team, and they try to evaluate
> and replied the result.
> 
> Currently they are using bpf to do the access control rules checking, and
> LSM access control method e.g. Landlock is quite similar to a rules based
> control method. They still need to persist all the rules on disk, and load
> the rules during system initlization time. When the number of rules increased,
> the maintennance is complicated and slow.
> 
> Also the application team give me a use case, ask how to achieve the access
> control effiently. Let me describe by the followed text.
> 
> Users store they photos on the system, and the compact AI module processes all
> their photos and groups all the photos into different categories like pizza,
> dogs, cats, foods or group photos. After the process done, users may see they
> photos in different categories that the AI module thinks they should be in. Then
> users may share the categories with photos to others. If indentical categories
> shared by different users, the shared photos can be combined all together. And
> AI module may continue to process the shared photos and generate new categaries
> from the shared photos, e.g. pizza in the same city, cats and dogs in closed
> location, group photos contains the most common people, etc. Now the differet
> categories are implemented by different directories in the publicly shared
> directory.
> 
> In each category directory, photos with a category (or attribution) can be
> accessed as hard links to the original photo inodes and share the identical
> inodes. All these category directories are created by the AI module, although
> the photos are shared from each users. If a user is identified from a group
> photo, and this user is noticed that the photo is publicly shared. If this user
> doesn't want his face to be shared in public, for an optinal privacy protection
> right, this user can remove the hardlink of the photo which his or her face is
> in, that is he or she can remove the hardlink (dentry) under a publicly shared
> directory which this user doesn't have write permission. Because this user can
> be idnetified as owner of his or her face, and the photo has his face in, he or
> she should have write permission to delete the photo, but no write permission to
> other photos in same category directioy which his or her face is not in.


What permissions/rights does the AI module have such that it can create
a file in shared/photos/faces from my personal files?
The shared file with my photo is still owned by the sharing user, correct?
What are the permissions/owner of the parent directory?

What permissions are required in my personal photos directory to allow
files there to be shared?

It sounds to me like the AI was aggressive in sharing; now you (the user)
want to correct/fix that. The AI could be trained better, but that's too
difficult. (just playing devil's advocate there)

I haven't looked at this in any detail, but I'm wondering if an
intermediate directory level with "my" permissions/ownership would
allow a fix for this issue. Then I (the user) could remove the file
(the hardlink) from the intermediate directory. However, that might
leave some dangling link in the final shared directory. I don't know
enough about it to answer that.


> The above example is one of the simple case just for photos processing and
> sharing in the AI context. The rules of access control are created or destoried
> dynamically and maybe only exist for a short period. And the number of rules are
> quite large.
> 
> Current rules based access control is inefficient and complicated to implement
> for the above simple case, and the application team replies they don't see the
> rules based LSM method can make it be more simple.

[snip]

>> One of the important parts of the LSM framework as a whole is that
>> LSMs can not grant access that would otherwise be blocked by the
>> standard/discretionary access controls built into the Linux kernel; in
>> other words, LSMs can only say "no" to an access, they can not grant
>> access by themselves.  Yes, this is by design, and no, I see no reason
>> to change that design decision at this point in time (doing so would
>> require a tremendous amount of work and likely introduce a fair number
>> of security regressions for quite some time).
> 
> I understand and agree the concern of security. But the reality is more and more
> similar or relative access control requirements will sprint up from the AI/LLM
> applications and use cases. We just want to solve the access control challenge,
> and the LSM rules based methods are not easy for application developers.

Do you have control over the AI that does this photo directory magic?

Anyway, it sounds like a reasonable topic for the kernel summit (as a
Tech Topic) instead of the maintainer's summit (process stuff).

-- 
~Randy


