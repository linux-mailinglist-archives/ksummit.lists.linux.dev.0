Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6777E3C48
	for <lists@lfdr.de>; Tue,  7 Nov 2023 13:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A95F128113B
	for <lists@lfdr.de>; Tue,  7 Nov 2023 12:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3AE2EB1F;
	Tue,  7 Nov 2023 12:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UmN/Lnff"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB7E2E418;
	Tue,  7 Nov 2023 12:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F5CC433C9;
	Tue,  7 Nov 2023 12:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699359243;
	bh=8O3YfSKR0ri2R4khmrLtRw7qDFvFMkV3jy4Nwxy8h9c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UmN/Lnff0tbqFaNVnHUS1zZV0nVv0juTdpoakgmp/VA/hB8n4pYOX2VETzyFYJYmo
	 8rt7JcIAec63xBCFGxIE4IQuEmHEY2s87OaKPiJ5s5emcNbmZop9o1/Fpk9lrFu7ns
	 nIiu6j2lPgbbMw0jorw1ZxkPZIpxJXYf+nrtRhC+4cS+KfBkCmxf/0+C8MWoxrUIU+
	 Cs8HSuDgMcCB9lv6QCWjqkTU+vaeXtNMOlgRTwR15c5Ab6u8TJSee9LfJsmCB5V3p6
	 jjnQRVo2qoaL8a89c56Dg3PF0myCv1HHOaIJGQXgBDLFL6vrpHwHWhLM6f9egZP//R
	 rgtPCW57IBx/A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Pavel Machek <pavel@ucw.cz>,
  Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
  users@linux.kernel.org,  ksummit@lists.linux.dev
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
In-Reply-To: <20231107101513.GB27932@pendragon.ideasonboard.com> (Laurent
	Pinchart's message of "Tue, 7 Nov 2023 12:15:13 +0200")
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
	<ZUluOoDjp/awmXtF@duo.ucw.cz>
	<34eda1fe-0e14-4f12-b472-d152eadb7b88@redhat.com>
	<20231107101513.GB27932@pendragon.ideasonboard.com>
Date: Tue, 07 Nov 2023 13:14:01 +0100
Message-ID: <mafs0o7g5hiba.fsf_-_@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Nov 07 2023, Laurent Pinchart wrote:

> On Tue, Nov 07, 2023 at 10:18:58AM +0100, Paolo Bonzini wrote:
>> On 11/6/23 23:52, Pavel Machek wrote:
>> >> For this reason, I propose switching the "F: *" entry in MAINTAINERS
>> >> ("THE REST") topatches@lists.linux.dev  instead. This list differs from LKML
>> >> in the following important aspects:
>> >
>> > How many patches are in "the rest" area? I don't think it is that
>> > many, and I believe those should be broadcasted, as it is not clear
>> > who should handle them. And lkml seems to be reasonable place for them
>> > at the moment.
>>
>> Indeed, I suspect that a lot of the traffic to LKML does not come from
>> "THE REST", but rather from people using a git-send-email configuration like
>>
>>       [sendemail]
>>       to = linux-kernel@vger.kernel.org

FWIW, I do not have this nor have I seen any of my colleagues ever have
this in their config. In the patches I send, lkml always comes from
get_maintainers.pl.

>
> Do we document this as being a recommended git-send-email configuration
> ? That sounds horrible :-( Documentation/process/submitting-patches.rst
> states
>
>   linux-kernel@vger.kernel.org should be used by default for all
>   patches, but the volume on that list has caused a number of developers
>   to tune it out.  Please do not spam unrelated lists and unrelated
>   people, though.
>
> This should be updated, even if for the only reason that the text is
> quite confusing (in my opinion at least, I'm not sure if it means LKML
> should be used for all patches, or shouldn't).
>
> To give another data point, balancing a bit the replies that expressed
> surprise at Konstantin's point that LKML is generally seen as useless
> for holding actual discussions, I do not follow LKML at all due to the
> amount of mails that are not general discussions. It drowns the useful
> information in noise for me.

Yes, same for me. In general, I find the mail volume on LKML to be too
large for me to subscribe to it. Of late I have been relying more and
more on public-inbox and lei to read and browse kernel mail.

-- 
Regards,
Pratyush Yadav

