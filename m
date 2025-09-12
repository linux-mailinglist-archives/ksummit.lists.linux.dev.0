Return-Path: <ksummit+bounces-2375-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12557B54C70
	for <lists@lfdr.de>; Fri, 12 Sep 2025 14:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B9A51CC6ACE
	for <lists@lfdr.de>; Fri, 12 Sep 2025 12:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63162320A28;
	Fri, 12 Sep 2025 11:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URhWBMbb"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C355A30214B
	for <ksummit@lists.linux.dev>; Fri, 12 Sep 2025 11:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757678132; cv=none; b=qZM221Oahcc2lJLRX0QpxqHjTofywVOHAx/4ZWphNekVUvWeFhlIguroOOQRNq91SryKud9W2Tw41/YB3ykM6TbyDfWT6j0cjJ5dzTdBkUjtzpkxh770XDlGOFhwpWhNH36EP+TxRMNfzeOfduSJMJqht5B5+EttED1HTMrv/oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757678132; c=relaxed/simple;
	bh=R/+prnBfTZoHTZs8TkF1c7hLZbXS9wZl97fsfHyeSFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=luqyFBiSG94GcrJ54mDBjuJNc1RsQjCNdj/dmnlkSdorYlSgPDnog6tQalkGmORvaCxjCG6M513zL0H8/pWO7+yquuz37Kmf9L+Sf0HoWp4UtUYhx9Ey6f4Td9C9gCQAe2XhoyK10roK6bzITM6atd2Ju2E+AQgxgXPYFmHYpvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URhWBMbb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A52E4C4CEF1;
	Fri, 12 Sep 2025 11:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757678132;
	bh=R/+prnBfTZoHTZs8TkF1c7hLZbXS9wZl97fsfHyeSFM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=URhWBMbbdcIj8TDNbQg631vb0fcqV8WwtBUYOcI2Jaoj/vTCfRLgGOZjDPxEk6ylJ
	 A1SWD9lewGJ/auQPebsrsUGYP5Utyg6UQv8mhicB7DvkFGwo4mzblzgRp9tEHmxqRu
	 5ykQppO8O700lJyaDQyEwIdihGsoPReFiD2AxLJpiF3S/IZAtkahv3+4P1EQsmviYF
	 JJJDkzeE6og3qtnvULMwEn11oviWF/K4gtdWlw63jXizUP5vl+c0wjhoVOJsSfyvkS
	 CDt+H96xIf+Io0EquzYe2+9FSeJO3RiiXa3noY7LuUGl840ft7fkuOxc/Hgsgx/D7+
	 jER6btN4Ql0ew==
Message-ID: <fd7f9e60-18a8-491d-8deb-2edc8ef1f5cc@kernel.org>
Date: Fri, 12 Sep 2025 13:55:29 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS SUMMIT] Hidden commits from next (aka why
 maintainers hoard them in backpack)
To: Sasha Levin <sashal@kernel.org>
Cc: ksummit@lists.linux.dev
References: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
 <aMLFXhAVQE1VJ4ff@laps>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aMLFXhAVQE1VJ4ff@laps>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/09/2025 14:49, Sasha Levin wrote:
> On Thu, Sep 11, 2025 at 01:04:19PM +0200, Krzysztof Kozlowski wrote:
>> 1. Limited or no build bot coverage.
>>
>> 2. No actual integration testing, even if it is just spotting early
>> merge conflicts.
>>
>> 3. No wide community testing.
>>
>> 4. Contributors cannot base their patchsets on linux-next for
>> convenience, but need to find each sub-maintainer tree and pull it. For
>> few cases (see further) these sub-maintainer trees are not documented in
>> MAINTAINERS, so it is impossible for contributor to rebase on current
>> maintainer's tree!
> 
> This topic seems to come up on an annual basis :)
> 
> As a follow up to last year's discussion[1] I wrote a bot[2] that is able to
> analyze pull requests and respond with statistics about how long commits spent
> in -next as well as on the mailing lists. An example of the reports it produces
> is available here[3].

Oh, I missed that, these are nice!

> 
> I haven't ended up receiving signal from Linus that it's useful and not a waste
> of his time, so I stopped sending these mails out.


Honestly, I have a feeling that importance of this topic a bit depends
where do you look. Or where do you put your fingers. I work a lot with
multiple subsystems, although 99% of them around drivers, with frequent
inter-dependencies and cross-tree interactions. And by "work" I mean as
submitting patches and as a maintainer.

The best example here is the SoC DTS (Devicetree sources, so
arch/*/boot/dts/*) which is supposed to be completely independent of
actual drivers. Independent in a meaning it must go via different tree
(SoC tree) and never mixed or actually depending on the drivers, while
of course the driver implementation is necessary for entire thing to
work for the final user. That's by design.

I found for everything around me extremely important that accepted
patches reach linux-next as fast as possible. I found also similar
voices in the this email thread, so I am not alone in this judgment.

I can also imagine that if one does not deal ever with patchsets
touching multiple subsystems or does not have upstream/downstream
maintainership model, things are a bit simpler.

But really for these many things around me, commits not being in the
next is a significant pain (and appearing in next 1 week before merge
window does not count, because it is already too late for me to do
anything, since my upstream maintainers partially closes their tree
around rc6-rc7).


Best regards,
Krzysztof

