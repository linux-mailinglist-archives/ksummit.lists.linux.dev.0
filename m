Return-Path: <ksummit+bounces-2761-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34192D14DB8
	for <lists@lfdr.de>; Mon, 12 Jan 2026 20:05:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D29430E8D10
	for <lists@lfdr.de>; Mon, 12 Jan 2026 19:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F91A311C01;
	Mon, 12 Jan 2026 19:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zDYhZ04A"
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2595D31281F
	for <ksummit@lists.linux.dev>; Mon, 12 Jan 2026 19:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768244536; cv=none; b=Z+i8ycBXZA3ii9gUMc3zyiwk5J7f6n2p3C86Cj3V+M1UGpJiKriQR9zIh1fKlvrKDwTQi8YPYjCHepcHmR+QF16wsOuId5gi71pm+xJJu98gDR5ETXqv0HvJua7XodCMxuOskGtyYXviH+/t1kuQ7dJ7d2Cg26kGmiXYlK1ulyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768244536; c=relaxed/simple;
	bh=GpJ3wKU+LeNXnyIMJBhluREBdYPEkL8iKexGxHcEO2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+4yQ/9WofdZfuhKLWYEbV85ssAPSICGucglZGtwQhVntI9NU9sWGOnsuNgzxZSdKvlplWEC9dgf+exaTD3JJR5c/jqU/pSEq5hOAptFM9lXonaZCCPRlNu73gY9XRLiXpGa+g0QBPwD2PjqdAW7KHEztldqgZzFPoPlQTP42kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zDYhZ04A; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso40593865e9.0
        for <ksummit@lists.linux.dev>; Mon, 12 Jan 2026 11:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768244528; x=1768849328; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4pwSmM1gT+NcRUqZym3XAVxxt9CfdNJcHOpVBLrqk4o=;
        b=zDYhZ04APDkSUWBeLiHZtLQsUQmsEFmgp0kNE7R+BpAiPsDWEWvkWL8w4JYD/PXilH
         g5a9K5e78XGl/RdqVd954sHc9NnexxqS+eMF22n1iYqVC4/a4QOM9CzAmMX+4XeGgGy3
         +BR69vFgcAVRj3gC+XeSNv8WT7l8uvbwvew9uIcHVSgMjiQ4ojUM30vwEdOnD+3a6fgX
         BFEXCOIVegDaG88AMAFR997aRMdn91kPIZW9x91QLnt+zRTp9uvjbfrzK4Uenq4nfpWj
         rk8pSd6dTR5wJX5eXAjmqd3xefiSov+g7+O6aOJSHsKbTN9xaSth0/wBqVYmHnCcAkO4
         iP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768244528; x=1768849328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4pwSmM1gT+NcRUqZym3XAVxxt9CfdNJcHOpVBLrqk4o=;
        b=Z8QV9dABpUW0l2ON072MZFg/qgL60QyRfRFLqUmebbyERz02KHoqaAicgXHUCsUWWW
         38jwM9a8vU5gLSitqmoaTw7n90JyzG01roDMZpvO3/NN1SUB4i2HMwHWFioUoJwHHjMm
         FzbagSb5/glQbtY3SI6gjYyYdoBV9CTmo3fT9MvG1JeSxlKhCZvZ7mfZyei+Q2uG5YIn
         XR2PcBffUZ24FNXGlXs5MFx5Zq+QscEXklRUxOji3l7MXhVnqbjar9HR37vVwOUXzrOZ
         xs/sLXZswAcwFT6YLGeha9ZS3B4H1MEKTHIiBBu07EsPHcgAFWTJhMA5MXjaOy5oOd6P
         NMcA==
X-Forwarded-Encrypted: i=1; AJvYcCWUzQVduyVLH+Un42SatypXqxjGg+6yJEI8sOOp1qa+MS3rO9BcPbKNlGuXPyYMAaX8wYK0xK92@lists.linux.dev
X-Gm-Message-State: AOJu0YxyS6tv8d18Plj7yJMlHTehPOfr1hBzTFexwPWT49WaBoz3Li+D
	JSMD5mDjGZyf6r+YAH+20pRh73HZ6cHWutxF8puzQT2c32FiQ7cJWfY+KEFwpcdyl9o=
X-Gm-Gg: AY/fxX4W8/jAsJ7u26guXY245iuS2NdglUh7vS7sCBE6z1+ssK4QIKtK1Ili+CvOc0J
	Me5Qr6mSA/3k1eTdjUkvzC/qVSvVGr/cnsbxXmVW/+UP24iZy7O0f9Mp7JwKxaPfwFdRl1nu9JH
	pItGNy42xdYDosL0fPQRQ20o926jqPihoL5enhfUjcp4jatDjPbW6Rx7cZ7EUrlkkka92suylCs
	dh/cI1QK5FOtlfRqbGUeFieOIR6mbSYejgRaZPxycDp8ppDHj9An69Stqn7b7gwKN7YH/W5me6M
	lU1waOcKx5u+/+zt8VfPJK3VsoepPrOqEc4fOxGAi3jpp6x3aHJ2P0bwts9RsZyFnzNVtyLRNZx
	ryDoFbwoLtd0wTkEFCJH3ms7VI4v3gqF2eGvUdFNkIl7fuh1Vw1IIDNspTXZUVr+rxiV4IXvGTG
	vpF0yqPInh3vmBdsWD
X-Google-Smtp-Source: AGHT+IHDDtSWfiRlGnF3a09bKQUbQh6KJSFhRFbtjUj5cC3oyQnHB16AsuI/tST8xry5sUSEgb1vCg==
X-Received: by 2002:a05:600c:1d19:b0:47b:d914:98a7 with SMTP id 5b1f17b1804b1-47d84b3b65bmr221489695e9.29.1768244528451;
        Mon, 12 Jan 2026 11:02:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ed8aff4aesm1894695e9.5.2026.01.12.11.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 11:02:07 -0800 (PST)
Date: Mon, 12 Jan 2026 22:02:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Matthew Wilcox <willy@infradead.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Jens Axboe <axboe@kernel.dk>, Dave Hansen <dave.hansen@intel.com>,
	Dave Hansen <dave@sr71.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Steven Rostedt <rostedt@goodmis.org>, NeilBrown <neilb@ownmail.net>,
	Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
	workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <aWVFLFdrs410YxU6@stanley.mountain>
References: <a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
 <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
 <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
 <711d9e37-6fe7-4783-8ac4-5269279bb9fe@kernel.dk>
 <3xf3f4b3vegssexoid746y7isuswwsgmac5hy2hm4ipisdcxaf@nbi67byycwj5>
 <aWCSVh6NocePMvp8@stanley.mountain>
 <0b9a8f99-5cc4-40e8-a0e6-4887d1e1a796@lucifer.local>
 <aWJvcPeV5ziCt5Du@mail.hallyn.com>
 <aWJ1ufun16-5EEkb@casper.infradead.org>
 <39da84e891a8ccd4a17115ce6a399c2f6498e78f.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39da84e891a8ccd4a17115ce6a399c2f6498e78f.camel@HansenPartnership.com>

On Sat, Jan 10, 2026 at 11:02:19AM -0500, James Bottomley wrote:
> On Sat, 2026-01-10 at 15:52 +0000, Matthew Wilcox wrote:
> > On Sat, Jan 10, 2026 at 09:25:36AM -0600, Serge E. Hallyn wrote:
> > > I just don't think the word "slop" should be used, because while it
> > > may be very clear to you, and may be clearly defined in some
> > > communities, me, I'm just guessing what you mean by it.
> > 
> > https://www.merriam-webster.com/wordplay/word-of-the-year
> 
> Just because it's the word of the year this year doesn't mean people
> will remember what it means even after a few years.  "Rawdog" was the
> OED word of the year in 2024 ... that's losing its resonance and who of
> the under 30 crowd knows what the 2000 word of the year "chad" means? 
> The point of the formulation I proposed (without mentioning slop) was
> to be generic and retain its meaning over time.

Slop means you produced the patches in such quantity that you don't have
time to review the output before sending it.  This isn't a totally new
thing, people have used clang-format to reformat a whole driver and it's
clear they didn't look at the output.

Even for bug reports, the truth is that no one reads mass bug reports.
I occasionally send mass bug reports if I create a new warning.  No one
ever reads them.

regards,
dan carpenter

