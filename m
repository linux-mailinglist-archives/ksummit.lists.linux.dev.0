Return-Path: <ksummit+bounces-2346-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B862B53295
	for <lists@lfdr.de>; Thu, 11 Sep 2025 14:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD9C3483ED0
	for <lists@lfdr.de>; Thu, 11 Sep 2025 12:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E8E230BE9;
	Thu, 11 Sep 2025 12:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tc5u0uzQ"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE15B184E
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 12:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757594571; cv=none; b=MC0g+mwYeHqu/U9HntvAWENsfYPMFdMamEfUFrisYsXRbbLDiyiYOasGlLHNqlu//yN/v2atkfJlL3t+zdY9qpcnzCVSdB2Adn3PFM+QR5BQo4uiFk8VtMDo9li1C1eZJvPix+iNU8y4QnAMXYXIV2JF5CgTc90Q2mbPE5TD5DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757594571; c=relaxed/simple;
	bh=9ejBEeCEh0y2m9n7xaXQJQijA6D8cmBmuZIf/wvYFFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jk0FGZNCRS5SiGM/2/cSO48TCUn6JRtbMOP6Um12+Z/Fmu0oibsEg4OPlUX5P9xqpVCCIxPCW+C2Qaf5Y1tRaPDQbALZX0sGLUZb9Hcam4HhsKu3h1tT40/zmp8G41Oce3tZJMHRMWrOGPNgPj7ZiXxSDozUOOBMMoO8fRgSjjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tc5u0uzQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3F0C4CEF0;
	Thu, 11 Sep 2025 12:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757594570;
	bh=9ejBEeCEh0y2m9n7xaXQJQijA6D8cmBmuZIf/wvYFFg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tc5u0uzQL0ky3mJxKUuLglD/bmc6kOYYfnGNxLoHRWQxu4XVY+QHL/sSuzg5+43Gh
	 CKqv/7H4wtgiCms6rKbmz+oK74o++J7ng17h0BZgt+BVPWyLoaQvAlU7482LXOm1Ie
	 8EVE54uOJxYSn0ZiohBl6v/nwVd8xH3wx/ngKl+ym2i3tPC7SR9nX0x3IG6Kus3QNb
	 B6stckkXoOMxwK3Nb/uV7I7DnxsQAELtjMhgi/RVMQYC7V4758GCO39QgnaxS8/AWa
	 l7UxVfaZIDjWKhYg/QHmx3UeIxqAbq8GcT3EwL+/OfMxsqNbd3TuRym+BsNtSHzWx3
	 Yoz0SKT6r9nzg==
Message-ID: <ed3b0fbf-2518-4a96-9ca5-22ed37965395@kernel.org>
Date: Thu, 11 Sep 2025 14:42:47 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS SUMMIT] Hidden commits from next (aka why
 maintainers hoard them in backpack)
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: ksummit@lists.linux.dev
References: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
 <20250911122711.GC8177@pendragon.ideasonboard.com>
 <CACMJSeuq3VrVHNoZ8Usnfkw7bSwF+f6rL1WPz0R4WRnCb6zypQ@mail.gmail.com>
 <20250911123333.GD13915@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250911123333.GD13915@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/09/2025 14:33, Laurent Pinchart wrote:
> On Thu, Sep 11, 2025 at 02:31:23PM +0200, Bartosz Golaszewski wrote:
>> On Thu, 11 Sept 2025 at 14:27, Laurent Pinchart wrote:
>>>
>>>> Just a friendly note, Laurent, I appreciate your work and I do not want
>>>> to point that you committed it incorrectly. In the contrary - your
>>>> commit is right, but your upstream maintainer stops you from including
>>>> this in linux-next. My aim here is only to discuss and improve the process.
>>>
>>> I would be happy to have my tree included in linux-next. I'm worried
>>> that the fact that the media subsystem cherry-picks my pull requests
>>> instead of merging them would cause issues though. Am I worrying
>>> needlessly, or is that a real issue ?
>>
>> Stephen Rothwell will send you automated emails about duplicate
>> commits being present in linux-next - one coming from your downstream
>> and one rebased in your upstream maintainer's tree.
> 
> So the question is how to redirect Stephen's complaints to the person
> who is responsible for the issue in the first place :-)


That's a real issue, so your worrying is correct, even if Stephen adds
exception for certain trees causing commit duplicates.

If commit appears twice in linux-next people might put the wrong one in
"Fixes" or "commit SHA" references. Duplicate commit is a redundant
information and waste of people's time (vide discussion about Link: tags).


I think DRM is even weirder here - already discussed in the past - where
they cherry-pick commits between branches causing duplicates and
reference other commit while not feeding them to linux-next promptly. I
still remember the one RC pull request from Intel to DRM which had
commits like:

    Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid ...
    (cherry picked from commit 97b6784753da06d9d40232328efc5c5367e53417)
    Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>

and when on linux-next you try to figure our what was the source here,
you get:
$ git show 97b6784753da06d9d40232328efc5c5367e53417
fatal: bad object 97b6784753da06d9d40232328efc5c5367e53417
(Tried with repo having several maintainer repos and the linux-next THAT
time; now it works...)

I also remember Linus pointing out some of these duplicates on mailing list.


Best regards,
Krzysztof

