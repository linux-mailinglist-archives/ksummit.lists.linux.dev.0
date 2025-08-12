Return-Path: <ksummit+bounces-2132-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF31FB22AD6
	for <lists@lfdr.de>; Tue, 12 Aug 2025 16:41:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 005613B53A8
	for <lists@lfdr.de>; Tue, 12 Aug 2025 14:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1672EBBA8;
	Tue, 12 Aug 2025 14:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="QlWgOdVR"
Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8D928726C
	for <ksummit@lists.linux.dev>; Tue, 12 Aug 2025 14:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755009416; cv=none; b=MGhb4nQ4xb90ztcx3BAYIm399mDMeJjEL2jGCFtvQ6IYIfco91bTTgqkpQg81FLsSDhgQ/X9UT7wXh1vAd+sL7eU43kEaDnGqgOOELSrWumOzSA+fiUgBCtRQUxai0K2f9X9DfwyMMxK0B7vZcTFRtiYqmPdAsN0SeQfmMgLQ4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755009416; c=relaxed/simple;
	bh=Ptq+Y0QteqBWU6wZNGOIUiBUt8hlGXhVFFC6DU21Yig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MFHoYfMDUvQd4IW0QomeZZSPJpcHz6ieFIJoPrlJrjuFVWu8Uu0g7w7/x3gH1B910qH+gJztggbnNjlboXczWt30KGS8t/VMh2TgzOfUpDzbH9Ouxmz6mK+No5aQMtDIu+2AFW9Smgq+W9GouNdKhZS4qqOsvrX1ALSj7irGo3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=QlWgOdVR; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ny/7vSRPcjN18aA6DlYSY8tyYL6U8Z5A1t9xNiTtubQ=; b=QlWgOdVRptoe+93vXJo/qQiKJJ
	1yJKmUXFmKei2P3AKeQ7MCBy3ORMsdHigwSc9vogGu3d4z/GS1ChbZENhh9TlgrmmrcNSmhhs6E0R
	vOqwatD5g7FMJemUNcIohbC7itu5avCZpG19S3wmBAnt1lP6dHKJeHoSE+c8fHROAzeMI6vrpC1ZX
	RFBHW76iN5vzgsOzuDkohcAlnvs2q9gOMaiZhubIG2e8YRsdD973FpyEOEqFpDi7qKO+NnYl7DUQ8
	8Hc67n9zoK/sjVJ4y0EaUIdRvHV6REHHEaVpvmwvYmdI1hanSSVJu+U2K2xAnTBbYXBkU8R2zT0UF
	SvDAAnVA==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1ulq7H-00CNCA-7m; Tue, 12 Aug 2025 15:36:43 +0100
Message-ID: <47ef32d0-f87d-4788-b2bc-f61390717667@codethink.co.uk>
Date: Tue, 12 Aug 2025 15:36:42 +0100
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
To: Mark Brown <broonie@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <e03f2583-c149-4fcf-aadb-81fe40afee46@suswa.mountain>
 <d7ddd076-3cf8-4604-82f3-7e18709484c3@sirena.org.uk>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <d7ddd076-3cf8-4604-82f3-7e18709484c3@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: ben.dooks@codethink.co.uk

On 06/08/2025 11:13, Mark Brown wrote:
> On Wed, Aug 06, 2025 at 11:17:23AM +0300, Dan Carpenter wrote:
> 
>> Just a "Patch generated with AI" under the --- cut off line would be
>> fine.
> 
>> We had a patch in staging from AI which "copy and pasted" from a spec
>> that it had hallucinated.  The language in the commit message is so
>> smooth and confident that it took a re-read to see that it's totally
>> nonsense.  A lot of the patches in staging are from newbies and
>> sometimes kids and I believe the person who sent the  AI assisted
>> patch did it with good intentions.  But, ugh, I don't want to deal
>> with that.
> 
> I think the suggestion from an earlier thread that people should say
> what the AI they were using (as they tend to for static checkers and
> so on) was good - that's useful for both noticing tools that work well
> and tracking things down if we notice a pattern of errors with some
> tool.

Also, if AI is used, then how was it used? Keeping the inputs may also
be useful ?

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

